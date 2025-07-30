contract TestDivc {
    // This contract tests the divc() function which computes the rounded up division
    // According to documentation:
    //   divc(3, 2) should yield 2
    //   divc(7, 3) should yield 3 (since 7/3 ≈ 2.33, round up -> 3)
    //   divc(-3, 2) should yield -1 (since -3/2 ≈ -1.5, round up -> -1)
    // The sum 2 + 3 + (-1) equals 4
    
    receive() {
        let r1: Int = divc(3, 2);
        let r2: Int = divc(7, 3);
        let r3: Int = divc(-3, 2);
        dump(r1 + r2 + r3);
        return;
    }
}
