struct Deep {
    a: Int;
    b: Bool;
    c: String;
}

struct Wrap {
    value: Deep?;
}

contract LayeredOpt {
    s: Wrap;
    init() {
        self.s = Wrap{ value: null };
    }
}