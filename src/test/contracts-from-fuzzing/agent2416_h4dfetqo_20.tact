struct NoDefault {
    foo: Int = 1;
    bar: Int = 2;
}

contract SetStructDefault {
    s: NoDefault;

    init() {
        self.s = NoDefault{};
    }
}