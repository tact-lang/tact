struct Pair {
    a: Int;
    b: Bool;
}

contract OptionalPairTest {
    pair: Pair?;

    init() {
        self.pair = null;
    }
}
