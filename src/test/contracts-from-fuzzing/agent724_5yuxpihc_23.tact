struct FooBar {
    foo: Int;
    bar: String;
    opt: Bool?;
}

contract OptionalOfNestedStruct {
    baz: FooBar?;

    init() {
        self.baz = FooBar{foo:1,bar:"s",opt:null};
    }
}