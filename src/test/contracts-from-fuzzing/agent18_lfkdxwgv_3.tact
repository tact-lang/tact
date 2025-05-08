contract Test {
    receive() {
        let x = ascii("Hello \n world!");
        dump(x);
    }
}