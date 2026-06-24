struct NestedStr {
    a: Int;
    b: String;
}

struct Container {
    s1: NestedStr;
    s2: NestedStr;
    flag: Bool;
}

contract MultiStructs {
    data: Container;

    init() {
        self.data = Container{
            s1: NestedStr{ a: 1, b: "one" },
            s2: NestedStr{ a: 2, b: "two" },
            flag: true
        };
    }
}