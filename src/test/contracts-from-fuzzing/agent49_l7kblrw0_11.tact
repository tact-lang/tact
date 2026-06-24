extends fun identity(self: Int): Int {
    return self;
}

contract TestExtension() {
    fun run() {
        dump(7.identity()); // expected output: 7
    }

    receive() {
        self.run();
    }
}
