struct ComposeRemaining {
    prefix: Int;
    rest: Slice as remaining;
}

struct OuterRemaining {
    inner: ComposeRemaining;
    value: Int;
}

contract ComposeRemainingFail {
    x: OuterRemaining;

    init() {
        self.x = OuterRemaining{
            inner: ComposeRemaining{prefix:5, rest:emptyCell().asSlice()},
            value: 10
        };
    }
}
