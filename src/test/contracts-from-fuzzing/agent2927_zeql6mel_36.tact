// Test nested many optionals and nested struct chain
struct B {
    foo: Int?;
}

struct A {
    bar: B?;
}

contract NestedDeepOptionals {
    nested: A?;

    init() {
        self.nested = null;
    }
}