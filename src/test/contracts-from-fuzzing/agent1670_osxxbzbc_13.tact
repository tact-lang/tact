struct Foo {
    a: Int;
    b: String;
    c: Bool;
    d: Int?;
    e: String?;
    f: Bool?;
    g: Cell?;
}

contract FooPersist {
    saved: Foo;

    init() {
        self.saved = Foo{
            a:1, b:"x", c:true, d:null, e:null, f:null, g:null
        };
    }
}