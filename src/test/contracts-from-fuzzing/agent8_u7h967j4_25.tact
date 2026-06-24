struct Foo {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
}

struct Bar {
    foo: Foo;
    g: Int;
    h: Bool?;
}

contract Combo {
    data: Bar;
    init() {
        self.data = Bar{
            foo: Foo{
                a:1, b:true, c:"hi", d:null, e:null, f:null
            },
            g:2,
            h: false
        };
    }
}