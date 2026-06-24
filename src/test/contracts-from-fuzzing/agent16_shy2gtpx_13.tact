extends fun double(self: Int): Int {
    return self + self;
}

contract TestExtension() {
    fun test() {
        let a: Int = 5;
        dump(a.double()); // expected output: 10
    }

    receive() {
        self.test();
    }
}
