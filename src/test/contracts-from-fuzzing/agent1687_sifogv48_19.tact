struct Inner1 { a: Int; }
struct Inner2 { b: Int; }

struct Nest {
    x: Inner1;
    y: Inner2;
}

struct Outer {
    nest: Nest;
}

contract Test {
    data: Outer;

    init() {
        self.data = Outer{ nest: Nest{ x: Inner1{ a: 1 }, y: Inner2{ b: 2 } } };
    }
}