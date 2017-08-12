import Bits
import CTLS
import Sockets

public protocol WriteableSocket: Socket, WriteableStream { }

// MARK: Writeable Stream

extension WriteableSocket {
    /// Sends bytes to the secure socket.
    ///
    /// - parameter bytes: An array of bytes to send.
    public func write(max: Int, from buffer: Bytes) throws -> Int {
        guard max > 0 else {
            // attempts to write something less than 0
            // will cause an ssl write error
            return 0
        }

        let bytesSent = SSL_write(
            cSSL,
            buffer,
            Int32(max)
        )
        if bytesSent <= 0 {
            throw makeError(
                functionName: "SSL_write",
                returnCode: bytesSent
            )
        }

        return Int(bytesSent)
    }

    public func flush() throws {
        // no flush necessary
    }
}
