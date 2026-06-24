extends mutates fun inc(self: Int): Int {
    return self + 1;
}

contract TestMutate(x: Int) {
    // Persistent state variable 'x' holds an integer value

    // The receiver calls the extension mutation to increment x
    receive() {
        self.x = self.x.inc();
    }

    // Getter to retrieve the current value of x
    get fun result(): Int {
        return self.x;
    }
}
