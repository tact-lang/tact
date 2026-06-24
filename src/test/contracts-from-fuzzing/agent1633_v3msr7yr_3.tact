struct BigNested1 {
    i1: Int;
    b1: Bool;
    s1: String;
    opt1: Int?;
}

struct BigNested2 {
    i2: Int;
    b2: Bool;
    s2: String;
    opt2: String?;
}

struct Container {
    nested1: BigNested1;
    nested2: BigNested2;
}

contract BigComplexStorage {
    storage: Container;

    init() {
        self.storage = Container{
            nested1: BigNested1{ i1: 10, b1: true, s1: "a", opt1: null },
            nested2: BigNested2{ i2: 20, b2: false, s2: "b", opt2: "opt" }
        };
    }
}