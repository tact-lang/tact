contract TestNoSemicolon2 {
    fun f(): Int {
        return 5
    }
}

contract TestComplexNested {
    fun complex(x: Int, flag: Bool): Int {
        repeat (3) {
            if (flag) {
                if (x > 10) {
                    return x;
                } else {
                    return x + 1;
                }
            }
        }
        return 0;
    }
}
