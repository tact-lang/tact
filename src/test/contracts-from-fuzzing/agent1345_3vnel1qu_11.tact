struct BigNested {
    foo: Foo;
    bar: Bar;
}

struct Foo {
    a: Int;
    b: Int;
    c: Int;
    d: Bool;
    e: String;
}

struct Bar {
    p: Bool;
    q: Int;
    r: String;
}

contract Test {
    big: BigNested;

    init() {
        self.big = BigNested{
            foo: Foo{ a:1, b:2, c:3, d:true, e:"e" },
            bar: Bar{ p:false, q:42, r:"r" }
        };
    }
}