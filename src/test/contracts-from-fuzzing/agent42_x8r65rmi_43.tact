struct Sub {
    foo: Int? = null;
    bar: Bool? = null;
}

contract ComboNulls {
    a: Sub;
    b: Sub?;
    c: Sub? = null;

    init() {
        self.a = Sub{};
        self.b = null;
        self.c = null;
    }
}