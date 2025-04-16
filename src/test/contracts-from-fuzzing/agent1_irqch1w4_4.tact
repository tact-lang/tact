contract Test {
    fun testNestedReturn(flag: Bool): Int {
        if (flag) {
            { return 1; } // nested block return
        }
        let x: Int = 3;
        while (x > 0) {
            if (x == 2) {
                return 2;
            }
            x -= 1;
        }
        return 0;
    }
}
