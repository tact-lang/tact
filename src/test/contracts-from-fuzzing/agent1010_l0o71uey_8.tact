struct InnerA { i: Int }
struct InnerB { b: Bool }
struct NestedPair {
    left: InnerA;
    right: InnerB;
}

contract CrossStructNested {
    pair: NestedPair;
    init() {
        self.pair = NestedPair{
            left: InnerA{ i: 5 },
            right: InnerB{ b: true },
        };
    }
}