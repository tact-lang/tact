contract TestTernary {
    receive() {
        let result: Int = (1 > 2) ? 100 : 200; // expected 200
        dump(result);
    }
}
