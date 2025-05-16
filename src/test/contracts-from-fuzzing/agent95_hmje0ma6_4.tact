struct Pair {
    first: Int;
    second: Bool;
}

contract Test {
    v: Pair = Pair{ first: 42, second: true };

    receive() {}

    // Getter function returning a custom struct type
    get fun get_pair(): Pair {
        return self.v;
    }
}
