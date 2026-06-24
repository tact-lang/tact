struct Inner { b: Int; }

struct Outer { a: Int; nested: Inner; }

contract Test {
    value: Outer;

    init() {
        self.value = Outer{ a: 1, nested: Inner{ b: 2 } };
    }
}