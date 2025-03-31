contract StringCompare {
    receive() {
        let s: String = "test";
        if (s == "test") {
            // String comparison successful
        } else {
            // Should not reach here
        }
    }
}
