fun bigBase64(): Slice {
    // Attempt a base64 string with more than 1023 bits of data (~128+ bytes)
    // According to docs, it should truncate without throwing.
    let s: String = "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA";
    let decoded: Slice = s.fromBase64();
    return decoded;
}

contract Test {
    receive() {
        let x = bigBase64();
    }
}
