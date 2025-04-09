struct InnerOne {
    x: Int;
}

struct InnerTwo {
    y: Bool;
}

struct InnerThree {
    z: String;
}

struct Outer {
    i1: InnerOne;
    i2: InnerTwo;
    i3: InnerThree;
}

contract MultiStruct {
    field: Outer;

    init() {
        self.field = Outer{
            i1: InnerOne{ x: 1 },
            i2: InnerTwo{ y: false },
            i3: InnerThree{ z: "z" }
        };
    }
}