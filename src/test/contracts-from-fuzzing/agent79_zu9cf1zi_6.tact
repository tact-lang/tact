contract TestOptionals {
    receive() {
        // Optional expression: using non-null assertion (!!) on an optional Int literal
        let opt: Int? = 42;
        let res: Int = opt!! + 1; // expected: 43
        dump(res);
    }
}
