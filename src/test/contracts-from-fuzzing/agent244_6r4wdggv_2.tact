struct Pair {
    a: Int;
    b: Bool;
}

contract TupleStorage {
    pair: Pair;

    init() {
        self.pair = Pair{ a: 1, b: true };
    }
}