struct Tuple2 {
    a: Int;
    b: Int;
}

contract Test2 {
    // Function with a while loop and early return
    fun loopReturn(n: Int): Int {
        let i: Int = 0;
        while (i < n) {
            if (i == n - 1) {
                return i;
            }
            i = i + 1;
        }
        return -1;
    }

    // Function with nested blocks returning a value
    fun nestedBlocks(): Int {
        {
            {
                return 10;
            }
        }
    }

    // Getter with tuple return using defined struct Tuple2
    get fun tupleGetter(flag: Bool): Tuple2 {
        if (flag) {
            return Tuple2 { a: 100, b: 200 };
        }
        return Tuple2 { a: -100, b: -200 };
    }

    // Receiver with explicit return; receivers don't return a value
    receive () {
        return;
    }
}
