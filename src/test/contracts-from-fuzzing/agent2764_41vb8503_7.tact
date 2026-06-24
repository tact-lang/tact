struct DefaultValues {
    n: Int = 0;
    b: Bool = false;
    s: String = "";
    o: Int?; // default is null
}

contract HasDefaults {
    data: DefaultValues;

    init() {
        self.data = DefaultValues{};
    }
}