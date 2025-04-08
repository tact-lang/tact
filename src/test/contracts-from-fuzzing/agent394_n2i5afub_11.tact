struct Foo {
    txt: String = "abc";
    flag: Bool = false;
}

contract TestContract {
    foo1: Foo;
    foo2: Foo;
    foo3: Foo;

    init() {
        self.foo1 = Foo{ txt: "one", flag: true };
        self.foo2 = Foo{ txt: "two", flag: false };
        self.foo3 = Foo{ txt: "three", flag: true };
    }
}