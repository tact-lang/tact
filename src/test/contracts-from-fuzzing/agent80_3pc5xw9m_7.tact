struct DefaultsAndOptionals {
    a: Int = 5;
    b: Int?;
    c: String = "hello";
    d: Bool?;
}

contract DefaultOptionalFields {
    data: DefaultsAndOptionals;
    init() {
        self.data = DefaultsAndOptionals{
            a: 9,
            b: 10,
            c: "world",
            d: null
        };
    }
}