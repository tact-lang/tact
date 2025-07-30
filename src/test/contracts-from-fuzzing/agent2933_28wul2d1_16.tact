struct InnerMost {
    x: Int;
}

struct MiddleNested {
    inner: InnerMost;
}

struct HasRemaining {
    before: Int;
    payload: Slice as remaining;
}

contract RemainingMix {
    data1: InnerMost;
    data2: MiddleNested;
    trailing: HasRemaining;

    init() {
        self.data1 = InnerMost{ x: 1 };
        self.data2 = MiddleNested{ inner: InnerMost{ x: 2 } };
        self.trailing = HasRemaining{ before: 123, payload: "hello".asComment().asSlice() };
    }
}