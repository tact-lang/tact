struct OuterWithRemaining {
    x: Int;
    inner: InnerWithRemaining;
    y: Bool;
}

struct InnerWithRemaining {
    val: Int;
    tail: Slice as remaining;
}

contract NestedRemainingTest {
    o: OuterWithRemaining;

    init() {
        self.o = OuterWithRemaining{
            x: 1,
            inner: InnerWithRemaining{
                val: 123,
                tail: emptyCell().asSlice()
            },
            y: true
        };
    }
}