struct Inner1 {
    a: Int;
}

struct Inner2 {
    b: Bool;
    c: Int?;
}

struct NestedDifferent {
    f1: Inner1;
    f2: Inner2;
}

contract NestedMultiStruct {
    state: NestedDifferent;

    init() {
        self.state = NestedDifferent{
            f1: Inner1{ a: 1 },
            f2: Inner2{ b: true, c: null }
        };
    }
}