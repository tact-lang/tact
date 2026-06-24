contract Test {
    receive() {
        let a: Int = 10;
        let b: Int = 20;
        let c: Int = a + b;
        // using dump to ensure c is processed and variable declared
        dump(c);
    }
}
