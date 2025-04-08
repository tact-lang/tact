struct Child1 {
    x: Int;
}

struct Child2 {
    y: Bool;
}

struct Composite {
    f1: Child1;
    f2: Child2;
    opt1: Child1?;
    opt2: Child2?;
}

contract StructsOptionalAndNonOptional {
    comp: Composite;

    init() {
        self.comp = Composite{
            f1: Child1{ x: 1 },
            f2: Child2{ y: true },
            opt1: null,
            opt2: null
        };
    }
}