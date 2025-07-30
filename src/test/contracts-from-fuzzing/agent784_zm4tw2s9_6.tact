struct InnerLevel3 {
    d: Int;
}

struct InnerLevel2 {
    c: InnerLevel3;
}

struct InnerLevel1 {
    b: InnerLevel2;
}

contract VeryDeep {
    a: InnerLevel1;

    init() {
        self.a = InnerLevel1{ b: InnerLevel2{ c: InnerLevel3{ d: 5 } } };
    }
}