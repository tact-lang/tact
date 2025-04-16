struct MixDefaultsOpt {
    a: Int = 1;
    b: Bool? = null;
    c: String? = "s";
    d: Int? = null;
}

contract MixDefaultsStruct {
    data: MixDefaultsOpt;

    init() {
        self.data = MixDefaultsOpt{};
    }
}