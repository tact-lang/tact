struct Foo {
    a: Int?;
    b: Bool?;
    c: String?;
}
contract C {
    f: Foo;
    init() {
        self.f = Foo{a:null,b:null,c:null};
    }
}