contract Test {
    receive() {
        // Dump an optional with a non-null value
        let x: Int? = 123;
        dump(x);

        // Dump an optional with a null value
        let y: Int? = null;
        dump(y);
    }
}
