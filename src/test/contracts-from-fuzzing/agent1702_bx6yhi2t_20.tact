struct Foo {
    x: Int?;
    y: Bool;
}

struct Bar {
    foo: Foo;
    z: String;
}

contract OptionalFieldInNestedStruct {
    bar: Bar;

    init() {
        self.bar = Bar{
            foo: Foo{x:null,y:true},
            z:"hi"
        };
    }
}
