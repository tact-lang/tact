struct Simple {
    a: Int;
    b: String;
}

contract InitOrderTest {
    foo: Simple = Simple{ a:1, b:"x" };
    init() {
        self.foo = Simple{ a:2, b:"y" };
    }
}