contract TestContract {
    receive() {
        // Test string concatenation via StringBuilder.concat
        let b: StringBuilder = beginString()
            .concat("foo")
            .concat("bar")
            .concat("-Tact!");
        let s: String = b.toString();
        dump(s);
    }
}
