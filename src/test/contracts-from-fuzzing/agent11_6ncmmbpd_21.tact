extends fun customPow(self: Int, c: Int): Int {
    let res: Int = 1;
    repeat(c) {
        res *= self;
    }
    return res;
}

contract Test {
    receive() {
        dump((2).customPow(3)); // expected output: 8
    }
}
