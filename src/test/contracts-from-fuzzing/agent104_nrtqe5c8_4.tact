struct DefaultsAndOptionals {
    a: Int = 1;
    b: Bool = false;
    c: Int?;
    d: Bool?;
}

contract DefaultsVsNulls {
    data: DefaultsAndOptionals;
    init() {
        self.data = DefaultsAndOptionals{
            c: null,
            d: null,
        };
    }
}