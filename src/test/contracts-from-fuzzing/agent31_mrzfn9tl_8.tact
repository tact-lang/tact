contract Test {
    receive() {
        // Testing string equality operator
        let eq: Bool = ("Hello" == "Hello");
        dump(eq);
    }
}
