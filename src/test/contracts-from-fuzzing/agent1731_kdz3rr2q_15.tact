struct Pair {
    a: Int;
    b: Bool;
}

contract TestContract {
    optPair: Pair?;

    init() {
        self.optPair = Pair{ a: 1, b: true };
    }
}