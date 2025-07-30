struct DefaultValues {
    valInt: Int = 100;
    valBool: Bool = true;
    valString: String = "default";
}

contract DefaultValuesContract {
    data: DefaultValues;

    init() {
        self.data = DefaultValues{};
    }
}