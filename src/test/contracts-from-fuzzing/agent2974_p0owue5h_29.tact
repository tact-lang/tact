// Contract constant equals struct field used in init
struct Foo { x: Int }

contract TestContract {
    const Z: Int = 123;
    foo: Foo;

    init() {
        self.foo = Foo{ x: self.Z };
    }
}