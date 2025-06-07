struct Pair {
    first: Int;
    second: Bool;
}

contract OptNested {
    pairOpt: Pair?;

    init() {
        self.pairOpt = null;
    }
}