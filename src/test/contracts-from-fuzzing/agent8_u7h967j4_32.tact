struct X {
    foo: Int;
    bar: String? = null;
}

contract DefaultsCombo {
    x: X;

    init() {
        self.x = X{ foo: 9 };
    }
}