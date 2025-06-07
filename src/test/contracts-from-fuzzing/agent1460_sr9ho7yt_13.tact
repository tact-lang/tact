struct Foo {
    x: Int;
    y: Int;
}

contract LargeArrayFields {
    f1: Foo;
    f2: Foo;
    f3: Foo;
    f4: Foo;
    f5: Foo;
    f6: Foo;
    f7: Foo;
    f8: Foo;
    f9: Foo;
    f10: Foo;

    init() {
        self.f1 = Foo{ x:1, y:2 };
        self.f2 = Foo{ x:3, y:4 };
        self.f3 = Foo{ x:5, y:6 };
        self.f4 = Foo{ x:7, y:8 };
        self.f5 = Foo{ x:9, y:10 };
        self.f6 = Foo{ x:11, y:12 };
        self.f7 = Foo{ x:13, y:14 };
        self.f8 = Foo{ x:15, y:16 };
        self.f9 = Foo{ x:17, y:18 };
        self.f10 = Foo{ x:19, y:20 };
    }
}
