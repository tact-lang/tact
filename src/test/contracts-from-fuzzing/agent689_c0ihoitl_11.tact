struct SInnerA {
    ai: Int;
    ab: Bool;
}

struct SInnerB {
    bi: Int;
    bb: Bool;
}

struct SMiddle {
    innerA: SInnerA;
    innerB: SInnerB;
    maybeInt: Int?;
    maybeStr: String?;
}

contract WideNestedTest {
    state: SMiddle;

    init() {
        self.state = SMiddle{
            innerA: SInnerA{ ai: 1, ab: false },
            innerB: SInnerB{ bi: 2, bb: true },
            maybeInt: 5,
            maybeStr: null,
        };
    }
}