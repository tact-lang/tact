struct DefaultsAndOptionals {
    a: Int = 100;
    b: Int?;
    c: Bool = true;
    d: Int?;
}

contract DefaultVals {
    field: DefaultsAndOptionals;

    init() {
        self.field = DefaultsAndOptionals{
            // skip a, use default 100
            // skip b, default null
            c: false,
            // skip d, null
        };
    }
}