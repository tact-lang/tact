struct A {
    f: Int;
}

contract OptionOptional {
    f: A? = null;

    init() {
        self.f = A{ f: 99 };
    }
}