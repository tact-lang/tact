struct Inner { a: Int; b: Int; }

struct Outer { inner: Inner; z: Int; }

contract Test {
    point: Outer;

    init() {
        self.point = Outer{ inner: Inner{ a: 1, b: 2 }, z: 3 };
    }
}