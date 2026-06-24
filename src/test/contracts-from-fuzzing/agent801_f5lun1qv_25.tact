struct ManyDefaults {
    v1: Int = 1;
    v2: Int = 2;
    v3: Bool = true;
    v4: Int?;
    v5: Bool?;
}

contract DefaultsContract {
    data: ManyDefaults;

    init() {
        self.data = ManyDefaults{
            v4: 44,
            v5: null
        };
    }
}