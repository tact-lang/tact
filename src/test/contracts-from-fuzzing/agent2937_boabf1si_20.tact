struct NestedRemaining {
    inner: InnerRemaining;
    id: Int;
}

struct InnerRemaining {
    data: Slice as remaining;
}

contract TestNestedRemaining {
    val: NestedRemaining;

    init() {
        self.val = NestedRemaining {
            inner: InnerRemaining {
                data: emptyCell().asSlice()
            },
            id: 5
        };
    }
}