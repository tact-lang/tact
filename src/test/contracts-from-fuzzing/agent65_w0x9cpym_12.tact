contract TestNestedReturn2 {
    fun test(flag: Bool): Int {
        if (flag) {
            {
                // Nested block with early return
                return 10;
            }
        } else {
            {
                if (!flag) {
                    // Nested block with conditional return
                    return 20;
                }
            }
        }
        return 0;
    }
}
