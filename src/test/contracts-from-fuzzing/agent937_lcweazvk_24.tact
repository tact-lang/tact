contract TwoStructFields {
    foo: Foo;
    bar: Bar;
    init() {
        self.foo = Foo{ val:1, name:"f" };
        self.bar = Bar{ active:true, score:55 };
    }
}

struct Foo {
    val: Int;
    name: String;
}

struct Bar {
    active: Bool;
    score: Int;
}