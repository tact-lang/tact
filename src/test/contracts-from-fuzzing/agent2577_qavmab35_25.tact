struct DefaultsAndOptions {
    n: Int = 42;
    flag: Bool = false;
    optStr: String?;
}

contract DefaultsOpt {
    field: DefaultsAndOptions;

    init() {
        self.field = DefaultsAndOptions{};
    }
}
