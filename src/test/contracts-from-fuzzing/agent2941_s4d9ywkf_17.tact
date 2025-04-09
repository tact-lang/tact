struct TwoStructs {
    i: Int;
    s: String;
}

struct Container {
    s1: TwoStructs;
    s2: TwoStructs;
}

contract DoubleStruct {
    cont: Container;

    init() {
        self.cont = Container{
            s1: TwoStructs{ i: 1, s: "foo" },
            s2: TwoStructs{ i: 2, s: "bar" },
        };
    }
}