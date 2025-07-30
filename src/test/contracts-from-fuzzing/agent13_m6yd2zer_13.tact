contract TestModulo {
    receive() {
        let a: Int = 10;
        let b: Int = 3;
        let mod: Int = a % b; // Expected: 10 % 3 = 1
        dump(mod);
    }
}
