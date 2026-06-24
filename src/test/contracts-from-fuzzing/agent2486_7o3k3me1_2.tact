struct Inner { x: Int; y: String }
struct Outer { a: Int; nested: Inner }

contract DeepNested {
    foo: Outer = Outer{ a: 1, nested: Inner{ x: 2, y: "hello" } };

    init() {
        self.foo = Outer{ a: 3, nested: Inner{ x: 4, y: "world" } };
    }
}