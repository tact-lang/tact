struct Inner1 {
    a: Int;
}

struct Inner2 {
    b: Int?;
}

contract NestedMixOptional {
    i1: Inner1;
    i2: Inner2;

    init() {
        self.i1 = Inner1{ a: 1 };
        self.i2 = Inner2{ b: null };
    }
}