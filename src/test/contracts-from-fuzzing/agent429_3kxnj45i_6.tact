struct NestedOpt2 {
    s1: Struct1?;
    s2: Struct2?;
}

struct Struct1 {
    a: Int;
}

struct Struct2 {
    b: Bool;
}

contract OptionManyNested {
    data: NestedOpt2;
    init() {
        self.data = NestedOpt2{
            s1: null,
            s2: Struct2{ b: true },
        };
    }
}
