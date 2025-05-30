const foo: Int = 123;

contract ShadowTest {
    foo: Int;

    init() {
        self.foo = 456;
    }

    receive() {
        let x = foo;       // should get global const 123
        let y = self.foo;  // persistent field 456
    }
}