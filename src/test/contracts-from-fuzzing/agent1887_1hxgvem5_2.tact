struct Inner1 { a: Int; }
struct Inner2 { b: Bool; }

struct Outer {
    inner1: Inner1;
    inner2: Inner2;
    flag: Bool;
}

contract NestedTest {
    data: Outer;

    init() {
        self.data = Outer{
            inner1: Inner1{ a: 10 },
            inner2: Inner2{ b: false },
            flag: true,
        };
    }
}