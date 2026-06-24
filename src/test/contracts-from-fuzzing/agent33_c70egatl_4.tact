const HASH1: Int = sha256("hello");
const HASH2: Int = sha256("hello");

contract TestSha256Consistency() {
    receive() {
        // Ensure the compile-time sha256 function produces identical results
        require(HASH1 == HASH2, "sha256 output inconsistent");
        
        // Confirm success by sending a simple message
        message(MessageParameters{
            to: sender(),
            value: 0,
            mode: SendRemainingValue,
            body: "SHA256 OK".asComment(),
        });
    }
}
