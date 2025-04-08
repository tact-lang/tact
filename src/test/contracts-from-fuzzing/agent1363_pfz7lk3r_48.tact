struct OptionalStringDefaults {
    s1: String?;
    s2: String?;
}

contract OptionalStringDefaultsContract {
    data: OptionalStringDefaults;

    init() {
        self.data = OptionalStringDefaults{
            s1:null,
            s2:null,
        };
    }
}