struct SingleLevel {
    i: Int;
}

struct TwoLevel {
    nested: SingleLevel;
}

contract WrapAround {
    val: TwoLevel;

    init() {
        self.val = TwoLevel{ nested: SingleLevel{ i: 333 } };
    }
}
