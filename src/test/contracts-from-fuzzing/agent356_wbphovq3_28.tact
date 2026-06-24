struct B1 {
    foo: Int;
}

struct B2 {
    bar: Bool;
}

contract TwoStructs {
    s1: B1;
    s2: B2;

    init() {
        self.s1 = B1{ foo: 5 };
        self.s2 = B2{ bar: true };
    }
}