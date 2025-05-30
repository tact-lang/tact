contract TestStringBase64Conversion {
    receive() {
        let base64String: String = "SGVyZSdzIEpvaG5ueSE=";
        let decoded: Slice = base64String.fromBase64();
    }
}