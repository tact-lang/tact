struct Inner1 {
    a: Int;
}

struct Inner2 {
    b: Bool;
    c: Inner1;
}

contract StructComposition {
    one: Inner1;
    two: Inner2;

    init() {
        self.one = Inner1{ a: 5 };
        self.two = Inner2{ b: true, c: Inner1{ a: 6 } };
    }
}
