struct Repeated {
    foo: Int;
    bar: Int;
}

contract StructTwice {
    s1: Repeated;
    s2: Repeated;

    init() {
        self.s1 = Repeated{ foo:1, bar:2 };
        self.s2 = Repeated{ foo:3, bar:4 };
    }
}
