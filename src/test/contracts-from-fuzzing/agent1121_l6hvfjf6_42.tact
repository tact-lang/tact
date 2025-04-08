// deeply nested serialization test
struct A {
    a: Int as uint4;
}

struct B {
    a: A;
}

struct C {
    b: B;
}

contract DeepSerialization {
    data: C;

    init() {
        self.data = C{b:B{a:A{a:3}}};
    }
}