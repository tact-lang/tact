contract StringBase64Test {
    receive() {
        let base64Str: String = "SGVyZSdzIEpvaG5ueSE=";
        let decodedSlice: Slice = base64Str.fromBase64();
        dump(decodedSlice);
    }
}