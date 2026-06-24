contract TestNonNull {
    receive() {
        // Optional expression with non-null assertion
        let x: Int? = 42;
        let y: Int = x!!;
        dump(y); // expected output: 42
    }
}
