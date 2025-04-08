struct Inner { a: Int }

struct Outer { b: Inner }

contract Test {
    f: Outer;

    init() {
        self.f = Outer{ b: Inner{ a: 1 } };
    }
}
