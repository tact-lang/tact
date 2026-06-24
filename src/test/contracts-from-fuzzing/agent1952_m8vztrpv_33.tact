struct NestedRemaining {
    header: Int;
    inner: RemainingStruct;
}

struct RemainingStruct {
    data: Slice as remaining;
}

contract TestContract {
    nr: NestedRemaining;

    init() {
        self.nr = NestedRemaining{
            header: 1,
            inner: RemainingStruct{
                data: emptyCell().asSlice(),
            },
        };
    }
}
