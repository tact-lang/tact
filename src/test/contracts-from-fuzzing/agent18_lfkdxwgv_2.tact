contract Test {
    receive() {
        let x = ascii("Hello, world!");
        dump(x);
    }
}