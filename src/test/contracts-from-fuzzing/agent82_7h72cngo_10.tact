contract TestStringHash {
    receive() {
        // Test hashData function on a string
        let h: Int = "Never gonna give you up!".hashData();
        // Just use dummy comparison to include h in compiled code
        let _dummy: Bool = h > 0;
    }
}
