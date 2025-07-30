struct NestedRemaining {
    f1: Int;
    f2: Nested2;
}

struct Nested2 {
    f3: Int;
    f4: Slice as remaining;
}

contract Test {
    data: NestedRemaining;

    init() {
        self.data = NestedRemaining{
            f1: 1,
            f2: Nested2 {
                f3: 2,
                f4: emptyCell().asSlice()
            }
        };
    }
}