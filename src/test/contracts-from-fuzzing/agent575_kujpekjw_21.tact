struct Sample {
    active: Bool = true;
    counter: Int;
}

contract SemiDefaults {
    s: Sample;

    init() {
        self.s = Sample{ counter: 77 };
    }
}