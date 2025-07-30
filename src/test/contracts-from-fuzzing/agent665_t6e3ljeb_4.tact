struct DefaultsAndOptionals {
    f1: Int = 7;
    f2: Bool = false;
    f3: String = "hello";
    f4: Int?;
    f5: String?;
    f6: Address?;
}

contract TestDefaults {
    data: DefaultsAndOptionals;

    init() {
        self.data = DefaultsAndOptionals{
            f4: null,
            f5: null,
            f6: null
        };
    }
}
