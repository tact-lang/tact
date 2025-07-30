contract Test {
    receive() {
        // using ternary operator for conditional assignment
        let res: Int = 10 > 5 ? 1 : 2;
        dump(res);
    }
}
