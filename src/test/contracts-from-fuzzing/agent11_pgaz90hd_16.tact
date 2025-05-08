contract TestDoubleZap() {
    // Testing ascii with a string of two Unicode lightning emoji
    // According to the documentation, ascii("⚡⚡") should produce 249153768823457
    const DOUBLE_ZAP: Int = ascii("⚡⚡");

    receive() {
        dump(self.DOUBLE_ZAP); // Expected: 249153768823457
    }
}
