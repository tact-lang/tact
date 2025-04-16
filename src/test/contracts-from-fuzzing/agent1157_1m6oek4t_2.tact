struct Nested1 { a: Int; }

contract TestContract {
    foo: Nested1?;

    init() {
        self.foo = null;
    }

    receive() {
        let tmp = self.foo;
    }
}