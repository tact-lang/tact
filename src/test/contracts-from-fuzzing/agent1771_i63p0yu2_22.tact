struct NestedRemaining {
    prefix: Int;
    payload: Slice as remaining;
}

struct Outer {
    code: Int;
    suffix: NestedRemaining;
}

contract NestedRemPersisted {
    data: Outer;

    init() {
        self.data = Outer{
            code: 99,
            suffix: NestedRemaining{
                prefix: 10,
                payload: emptyCell().asSlice(),
            },
        };
    }
}