struct Foo { a:Int; b:Int }
struct Bar { x:Foo; y:Foo; z:Foo }

contract DoubleNestTest {
    field: Bar;
    init() {
        self.field = Bar{
            x: Foo{a:1,b:2},
            y: Foo{a:3,b:4},
            z: Foo{a:5,b:6},
        };
    }
}