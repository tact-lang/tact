struct OptionalStringDefaults {
    s1: String? = null;
    s2: String? = null;
    s3: String? = null;
}

contract OptionalDefaultContract {
    data: OptionalStringDefaults;

    init() {
        self.data = OptionalStringDefaults{};
    }
}