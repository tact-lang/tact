contract Test {
    receive() {
        let x = ascii("Hello \xFF");
        dump(x);
    }
}