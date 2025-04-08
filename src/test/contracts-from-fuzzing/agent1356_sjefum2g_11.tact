struct DefaultsAndOptionals {
    a: Int = 42;
    b: String = "hi";
    c: Bool?;
    d: Int?;
}

contract DefaultsOptionalsContract {
    data: DefaultsAndOptionals;

    init() {
        self.data = DefaultsAndOptionals{
            c: null,
            d: 5
        };
    }
}