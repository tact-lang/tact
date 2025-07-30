struct Nested1 {
    a: Int;
}

struct Nested2 {
    b: Nested1;
}

struct Nested3 {
    c: Nested2;
}

struct Nested4 {
    d: Nested3;
}

contract FourNestedStructs {
    data: Nested4;

    init() {
        self.data = Nested4{d: Nested3{c: Nested2{b: Nested1{a: 1}}}};
    }
}
