struct Boo {
    b: Bool;
    s: String;
}

struct Foo {
    x: Int;
    y: Boo;
}

contract NestedStructs {
    foo: Foo;
    init() {
        self.foo = Foo{
            x:1,
            y: Boo{ b:true, s:"nested" }
        };
    }
}