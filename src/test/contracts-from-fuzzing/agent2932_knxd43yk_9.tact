struct DefaultsNested {
    a: Int = 1;
    b: Bool = true;
    c: String = "";
    d: InnerDefaults;
}

struct InnerDefaults {
    x: Int = 5;
}

contract DefaultValsContract {
    data: DefaultsNested;

    init() {
        self.data = DefaultsNested{
            d: InnerDefaults{x:7}
        };
    }
}