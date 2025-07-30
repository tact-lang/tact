contract TestOptional {
    receive() {
        let a: Int? = null;
        let b: Int? = 10;
        // Using non-null assertion on b
        dump(b!! + 5); // expected: 15
    }
}
