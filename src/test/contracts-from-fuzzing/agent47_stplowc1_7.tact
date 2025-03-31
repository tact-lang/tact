contract TestStringEquality {
    receive() {
        let a: String = "Test";
        let b: String = "Test";
        if (a == b) {
            a;
        } else {
            b;
        }
    }
}
