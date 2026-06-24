contract TestRegular {
    fun test(a: Bool): Int {
        if (a) {
            return 1;
        } else {
            let i: Int = 0;
            while (i < 3) {
                if (i == 2) {
                    return 42;
                }
                i = i + 1;
            }
            return 0;
        }
    }
}
