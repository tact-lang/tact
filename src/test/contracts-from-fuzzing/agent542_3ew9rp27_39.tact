struct NestedMixed {
    foo: Foo;
    bar: Bar;
}

struct Foo {
    x: Int;
    y: Bool;
}

struct Bar {
    msg: String;
    opt: Int?;
}

contract TestContract {
    v: NestedMixed;
    init() {
        self.v = NestedMixed{
            foo: Foo{ x:5, y:false },
            bar: Bar{ msg:"text", opt:null }
        };
    }
}