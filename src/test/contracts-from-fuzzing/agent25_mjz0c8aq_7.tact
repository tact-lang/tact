extends fun double(self: Int): Int {
    return self * 2;
}

contract TestExtension {
    fun test() {
        let n: Int = 21;
        let d: Int = n.double();
        dump(d); // Expected: 42
    }

    receive() {
        self.test();
    }
}
