struct Pair {
    first: Int;
    second: Int;
}

struct NestedPair {
    outer: Pair;
    inner: Pair;
}

contract PairsInPairs {
    data: NestedPair;

    init() {
        self.data = NestedPair{
            outer: Pair{first:1, second:2},
            inner: Pair{first:3, second:4}
        };
    }
}
