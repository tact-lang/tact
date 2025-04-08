struct Foo { 
    a: Int; 
    b: Bool; 
    c: Slice; 
    d: Cell; 
    e: String;
}

contract NestedStructTest {
    foo: Foo;

    init() {
        self.foo = Foo{
            a: 1,
            b: true,
            c: emptyCell().asSlice(),
            d: emptyCell(),
            e: "hello"
        };
    }
}