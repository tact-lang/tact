struct Complex {
    a: Int;
    b: Bool;
}

contract TestParamGetter {
    receive() {}

    // Getter with a parameter that computes a composite return value
    get fun compute(val: Int): Complex {
        return Complex { a: val * 2, b: val > 10 };
    }
}
