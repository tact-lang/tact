struct MixedDefaults {
    flag: Bool? = null;
    count: Int? = 10;
    name: String? = null;
    ready: Bool?;
    value: Int?;
    text: String?;
}

contract TestContract {
    data: MixedDefaults;

    init() {
        self.data = MixedDefaults{
            ready: null,
            value: 5,
            text: null
        };
    }
}