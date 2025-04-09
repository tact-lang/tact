struct Foo {
    x: Int;
    y: Bool;
}

contract UninitializedStruct {
    s: Foo;
    
    init() {
        self.s = Foo{
            x: 123,
            y: false
        };
    }
}