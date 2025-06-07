contract TestStringEquality {
    receive() {
        let a: String = "test";
        let b: String = "test";
        if (a == b) {
            // Do nothing, just test comparison
        } else {
            // This won't happen
        }
    }
}
