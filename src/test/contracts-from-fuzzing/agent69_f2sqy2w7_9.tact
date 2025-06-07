contract Trailing {
    a: Int;
    init(
        a: Int, // trailing comma allowed
    ) {
        self.a = a;
    }
    receive() {}
}

contract TestTrailing {
    receive() {
        let s: StateInit = initOf Trailing(42);
    }
}
