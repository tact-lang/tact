struct DefaultsComplex {
    i: Int = 0;
    b: Bool = false;
    s: String = "hello";
    oi: Int? = null;
    ob: Bool? = null;
    os: String? = null;
}

contract DefaultsAll {
    val: DefaultsComplex;

    init() {
        self.val = DefaultsComplex{};
    }
}