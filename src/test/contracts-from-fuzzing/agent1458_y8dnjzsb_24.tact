struct InnerMost {
    prefix: Int;
    rest: Slice as remaining;
}

struct Middle {
    inner: InnerMost;
    y: Int;
}

struct Outer {
    mid: Middle;
    z: Bool;
}

contract Test {
    val: Outer;

    init() {
        self.val = Outer{
            mid: Middle{
                inner: InnerMost{
                    prefix: 10,
                    rest: emptyCell().asSlice(),
                },
                y: 5,
            },
            z: true,
        };
    }
}