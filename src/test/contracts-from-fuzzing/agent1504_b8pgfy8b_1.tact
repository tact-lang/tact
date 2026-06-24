struct Nested {
    a: Int;
    b: Bool?;
    c: String;
}

contract TestContract {
    foo: Int = 1;
    bar: Bool = true;
    baz: String = "hello";
    nested: Nested = Nested{
        a: 2,
        b: false,
        c: "world",
    };
    
    receive() {
        dump(self.foo);
        dump(self.bar);
        dump(self.baz);
        dump(self.nested.a);
    }
}