struct OptStringDefaults {
    name: String? = null;
    code: String;
}

contract OptStringDefaultContract {
    data: OptStringDefaults;

    init() {
        self.data = OptStringDefaults{
            code: "XYZ"
        };
    }
}