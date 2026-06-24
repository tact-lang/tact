contract Test {
    // Test for literal receiver with a multibyte message reaching exactly 123 bytes
    // Here, 'ä' in UTF-8 occupies 2 bytes. By repeating 'ä' 61 times (122 bytes) and appending 'a' (1 byte), we reach 123 bytes exactly.
    receive("äääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääa") {
        // empty body
    }

    // Fallback binary receiver
    receive(msg: Slice) {
    }
}
