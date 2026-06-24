struct NestedOpt {
    optB: Bool?;
}

struct Outer {
    no: NestedOpt?;
}

contract OptionalOptional {
    f: Outer;

    init() {
        self.f = Outer{ no: null };
    }
}