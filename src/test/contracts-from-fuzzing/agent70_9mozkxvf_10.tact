contract Test {
    // Testing ternary operator in a valid scenario
    receive() {
        let x: Int = true ? 10 : 20;
        dump(x);
    }
}
