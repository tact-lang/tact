// mixing deeply nested structs and interleaved primitives
struct A { foo: Int; }
struct B { bar: A; }
struct C { baz: B; }
struct D { qux: C; }

contract Test {
    d: D;
    num: Int;
    flag: Bool;

    init() {
        self.d = D{qux: C{baz: B{bar: A{foo: 73}}}};
        self.num = 17;
        self.flag = false;
    }
}