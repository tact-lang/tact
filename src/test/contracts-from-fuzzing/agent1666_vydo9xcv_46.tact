contract MultiStruct {
    foo: Foo;
    bar: Bar;
    
    init() {
        self.foo = Foo{ a: 1, b:true };
        self.bar = Bar{ c: "hi", d: false };
    }
}

struct Foo {
    a: Int;
    b: Bool;
}

struct Bar {
    c: String;
    d: Bool;
}
