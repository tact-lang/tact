struct DefaultValues {
    flag: Bool = true;
    count: Int = 5;
    message: String = "hello";
}

contract DefaultsContract {
    data: DefaultValues;

    init() {
        self.data = DefaultValues{};
    }
}
