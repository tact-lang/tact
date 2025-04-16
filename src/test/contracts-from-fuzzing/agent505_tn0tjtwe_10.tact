struct InnerMost {
    x: Int;
}

struct Middle {
    inn: InnerMost;
    flag: Bool;
}

struct Outer {
    mid: Middle;
    desc: String;
}

contract DeeplyNested {
    field: Outer;

    init() {
        self.field = Outer{
            mid: Middle{inn: InnerMost{x: 5}, flag: true},
            desc: "Nested"
        };
    }
}
