// Multiple structs in contract fields directly (composition)
struct Foo { x: Int; y: Bool; }
struct Bar { s: String; a: Address; }

contract TestContract {
    foo: Foo;
    bar: Bar;
    init() {
        self.foo = Foo{x:1,y:true};
        self.bar = Bar{s:"s",a:myAddress()};
    }
}