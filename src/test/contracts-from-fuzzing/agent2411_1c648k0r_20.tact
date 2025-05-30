struct InnerOne {
    a: Int;
    b: Int;
}

struct InnerTwo {
    x: Bool;
    y: String;
}

struct Comb {
    i1: InnerOne;
    i2: InnerTwo;
}

contract CombContainer {
    combined: Comb;

    init() {
        self.combined = Comb{
            i1: InnerOne{a: 11, b: 22},
            i2: InnerTwo{x: true, y: "hello"},
        };
    }
}