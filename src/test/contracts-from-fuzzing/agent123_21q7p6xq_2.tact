struct DeepNested { b: Bool; c: Int; }

struct Nested { a: Int; deep: DeepNested; }

contract TestContract {
    foo: Nested;

    init() {
        self.foo = Nested{ a: 10, deep: DeepNested{ b: true, c: 20 } };
    }
}