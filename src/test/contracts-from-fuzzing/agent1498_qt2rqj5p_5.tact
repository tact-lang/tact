struct DefaultsComplex {
    a: Int = 1;
    b: Int?;
    c: NestedDefaults;
}

struct NestedDefaults {
    x: Int = 42;
    y: Int?;
}

contract TestContract {
    conf: DefaultsComplex;

    init() {
        self.conf = DefaultsComplex{
            c: NestedDefaults{}
        };
    }
}
