struct DefaultValues {
    a: Int = 7;
    b: Bool = true;
    c: String = "abc";
    d: Int?;
    e: Bool?;
    f: String?;
}

contract TestContract {
    data: DefaultValues;

    init() {
        self.data = DefaultValues{};
    }
}