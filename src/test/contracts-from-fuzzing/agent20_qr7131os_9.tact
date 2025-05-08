contract TestCasting {
    receive() {
        // Using extension function toString() as a casting-like expression
        let a: Int = 42;
        dump(a.toString());
    }
}
