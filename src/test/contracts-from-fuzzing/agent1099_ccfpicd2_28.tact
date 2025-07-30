struct A {
    f: Int;
}

contract DefaultsFromStruct {
    st: A = A{ f:123 };

    init() {
        self.st = A{ f: 456 };
    }
}