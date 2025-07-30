struct Foo {
    v1: Int?;
    v2: Int?;
    v3: Int?;
    v4: Int?;
    v5: Int?;
}

contract Test {
    foo: Foo;

    init() {
        self.foo = Foo{ v1:null, v2:2, v3:null, v4:4, v5:null };
    }
}
