// Contract with explicit null default optionals and nested optionals
struct Foo {
    optInt: Int? = null;
    flag: Bool = true;
}

contract NullDefaultTest {
    foo: Foo? = null;

    init() {
        self.foo = null;
    }
}