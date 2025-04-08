struct DefaultsVsNulls {
    a: Int = 5;
    b: Int?;
}

contract MixDefaultsNulls {
    v: DefaultsVsNulls;

    init() {
        self.v = DefaultsVsNulls{};
    }
}