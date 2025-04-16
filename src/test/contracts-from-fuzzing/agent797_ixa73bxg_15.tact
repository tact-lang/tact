struct InnerD {
    foo: Int = 1;
}

struct OuterD {
    nested: InnerD = InnerD{};
    bar: Int = 2;
}

contract TestNestedDefaults2 {
    storage: OuterD = OuterD{};

    init() {}
}