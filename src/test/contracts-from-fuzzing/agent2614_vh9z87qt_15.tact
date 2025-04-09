struct TwoDefaults {
    x: Int = -1;
    y: Bool = true;
}

contract DefaultsInStruct {
    data: TwoDefaults;

    init() {
        self.data = TwoDefaults{};
    }
}