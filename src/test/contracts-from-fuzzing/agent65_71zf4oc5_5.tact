contract TestBase64Conversion {
    receive() {
        let original: String = "SGVyZSdzIEpvaG5ueSE=";
        let decoded: Slice = original.fromBase64();
        // Just checking the size of the decoded slice
        let size: Int = decoded.bits();
    }
}