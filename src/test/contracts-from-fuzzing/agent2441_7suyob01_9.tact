struct Pair {
    first: Int;
    second: Int;
}

contract PairOpt {
    pair: Pair?;

    init() {
        self.pair = null;
    }
}