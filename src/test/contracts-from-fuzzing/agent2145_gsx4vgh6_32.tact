struct Outer {
    prefix: Int;
    nested: WithRem;
    suffix: Int;
}

struct WithRem {
    a: Int;
    extra: Slice as remaining;
}

contract StorageTest {
    val: Outer;

    init() {
        self.val = Outer{
            prefix:5,
            nested:WithRem{ a:1, extra:emptyCell().asSlice() },
            suffix:42
        };
    }
}