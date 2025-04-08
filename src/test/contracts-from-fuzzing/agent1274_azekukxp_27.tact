struct Pair {
    first: Int;
    second: Int;
}

struct Wrapper {
    pair: Pair?;
}

contract NestedOptionalPair {
    w: Wrapper;

    init() {
        self.w = Wrapper {
            pair: null
        };
    }
}