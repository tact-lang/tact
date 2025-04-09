contract TestTernaryArithmetic {
    receive() {
        // If condition is true, 1 + 3 = 4, otherwise 2 + 3 = 5
        let a: Int = (true ? 1 : 2) + 3;
        dump(a);
    }
}
