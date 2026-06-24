struct Inner1 {
    flag: Bool;
    number: Int;
}

struct Inner2 {
    str: String;
    opt: Int?;
}

struct Outer {
    f1: Inner1;
    f2: Inner2;
}

contract NestedStructsComplex {
    storage: Outer;

    init() {
        self.storage = Outer{
            f1: Inner1{ flag: true, number: 123 },
            f2: Inner2{ str: "X", opt: null },
        };
    }
}