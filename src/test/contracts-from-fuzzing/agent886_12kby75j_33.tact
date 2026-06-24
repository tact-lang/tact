struct Sub {
    x: Int = 3;
    y: Bool = true;
}

struct ComplexDefaults {
    a: Int = 10;
    b: String = "abc";
    c: Bool? = null;
    d: Sub = Sub{};
}

contract TestContract {
    cd: ComplexDefaults;

    init() {
        self.cd = ComplexDefaults{};
    }
}