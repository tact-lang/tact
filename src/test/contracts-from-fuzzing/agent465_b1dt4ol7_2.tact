struct InnerMost {
    z: Int;
}

struct Middle {
    innerMost: InnerMost;
    optVal: Bool?;
}

struct Top {
    middle: Middle;
    number: Int;
}

contract TestContract {
    val: Top;

    init() {
        self.val = Top{
            middle: Middle{ innerMost: InnerMost{ z: 77 }, optVal: null },
            number: 55,
        };
    }
}
