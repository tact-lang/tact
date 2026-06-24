struct Boo {
    a: Int;
}

contract SameStructTwice {
    foo: Boo;
    bar: Boo;
    
    init() {
        self.foo = Boo{ a: 1 };
        self.bar = Boo{ a: 2 };
    }
}
