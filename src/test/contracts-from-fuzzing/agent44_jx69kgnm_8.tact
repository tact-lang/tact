contract StringTest {
    receive() {
        let base64: String = "SGVyZSdzIEpvaG5ueSE=";
        let decoded: Slice = base64.fromBase64();
    }
}