contract TestDivision {
    receive() {
        // Test integer division; expecting truncation toward zero
        let a: Int = 7 / 2; // 7/2 = 3
        dump(a);
    }
}
