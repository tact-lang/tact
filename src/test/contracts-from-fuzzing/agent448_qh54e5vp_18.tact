struct Foo {
    a: Int?; 
    b: Bool?; 
}

contract InitSomeNullSome {
    f: Foo;

    init() {
        self.f = Foo{ a: null, b: true };
    }
}