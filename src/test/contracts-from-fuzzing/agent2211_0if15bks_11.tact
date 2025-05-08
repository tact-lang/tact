struct Layer1 {
    f1: Int;
    f2: String;
}

struct Layer2 {
    l1a: Layer1;
    l1b: Layer1;
}

struct Layer3 {
    l2: Layer2;
    y: Bool;
}

contract MultiLevelNesting {
    nested: Layer3;

    init() {
        self.nested = Layer3{
            l2: Layer2{
                l1a: Layer1{f1: 1, f2: "a"},
                l1b: Layer1{f1:2, f2: "b"}
            },
            y: true
        };
    }
}