struct DefaultsDeep {
    a: Int = 4;
    b: Bool = true;
}

contract DefaultsDeepStore {
    d: DefaultsDeep;

    init() {
        self.d = DefaultsDeep{};
    }
}