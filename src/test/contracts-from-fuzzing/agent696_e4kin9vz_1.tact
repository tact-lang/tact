struct DeepNested {
    level1: Inner1;
}

struct Inner1 {
    level2: Inner2;
}

struct Inner2 {
    field: Int;
}

contract TestNested {
    nest: DeepNested;

    init() {
        self.nest = DeepNested{level1: Inner1{level2: Inner2{field: 42}}};
    }
}
