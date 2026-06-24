struct OneChild {
    v: Int;
}

struct TwoChild {
    w: Bool;
}

contract DistinctStructs {
    field1: OneChild;
    field2: TwoChild;

    init() {
        self.field1 = OneChild{v: 1};
        self.field2 = TwoChild{w: true};
    }
}