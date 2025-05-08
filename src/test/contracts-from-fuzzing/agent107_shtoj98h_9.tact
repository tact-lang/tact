struct LargeNested {
    foo: Foo;
    bar: Bar;
}

struct Foo {
    a: Int;
    b: Int;
}

struct Bar {
    x: Inner1;
    y: Inner2;
}

struct Inner1 {
    v1: Int;
    v2: Bool?;
}

struct Inner2 {
    s: String;
    addr: Address;
}

contract TestContract {
    data: LargeNested;

    init() {
        self.data = LargeNested{
            foo: Foo{ a:1, b:2 },
            bar: Bar{
                x: Inner1{ v1: 3, v2: null },
                y: Inner2{ s: "hi", addr: myAddress() }
            }
        };
    }
}
