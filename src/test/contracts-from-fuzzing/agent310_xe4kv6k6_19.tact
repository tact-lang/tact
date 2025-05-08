struct Base {
    a: Int;
}

struct Derived {
    inherit: Base;
    extra: Int;
}

contract HasNestedInheritTest {
    data: Derived;

    init() {
        self.data = Derived{
            inherit: Base{a:1},
            extra: 2
        };
    }
}