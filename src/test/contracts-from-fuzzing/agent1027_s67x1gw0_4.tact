struct DefaultsAndOptionals {
    a: Int = 10;
    b: String = "hello";
    c: Int?;
    d: Bool?;
}

contract DefaultOptionalMix {
    data: DefaultsAndOptionals;

    init() {
        self.data = DefaultsAndOptionals{};
    }
}