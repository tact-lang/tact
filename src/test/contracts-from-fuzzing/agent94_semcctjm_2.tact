contract Test {
    // Receiver function, should be allowed with an explicit return statement
    receive() {
        return;
    }

    // Regular function with early return
    fun foo(): Int {
        if (1 < 2) {
            return 100;
        }
        return 200;
    }

    // Getter function with conditional returns
    get fun bar(): Int {
        if (true) {
            return 10;
        } else {
            return 20;
        }
    }

    // Function with nested block and return inside nested if
    fun nestedReturn(): Int {
        let x = 5;
        {
            let y = x + 2;
            if (y > 6) {
                return y;
            }
        }
        return 0;
    }

    // Function with multiple conditional return paths
    fun multiplePaths(a: Int): Int {
        if (a > 10) {
            if (a > 20) {
                return 50;
            } else {
                return 30;
            }
        } else {
            return -10;
        }
    }
}
