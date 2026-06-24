struct MixDefaults {
    a: Int = 5;
    b: Int?;
    c: Bool = false;
    d: String = "hi";
    e: Bool?;
}

contract DefaultsMix {
    data: MixDefaults;

    init() {
        self.data = MixDefaults{
            b: null,
            e: null
        };
    }
}
