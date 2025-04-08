struct Compose {
    foo: Foo;
    bar: Bar;
}

struct Foo {
    x: Int;
    y: Bool;
}

struct Bar {
    s: String;
    opt: Int?;
}

contract TestContract {
    composed: Compose;

    init() {
        self.composed = Compose{
            foo: Foo{x:1,y:true},
            bar: Bar{s:"A",opt:null}
        };
    }
}