contract TestContract {
    receive() {
        // Checking ascii() with largest valid code point: \u{10FFFF}
        let x = ascii("\u{10FFFF}");
    }
}
