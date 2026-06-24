extends fun customPow(self: Int, c: Int): Int {
    let res: Int = 1;
    repeat(c) {
        res *= self;
    }
    return res;
}

contract TestExtension {
    receive() {
        // Testing extension function call
        let result: Int = 2.customPow(3); // expected 8
        if (result != 8) {
            throw(100);
        }
    }
}
