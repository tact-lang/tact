struct ManyOptionalDefaults {
    o1: Int?;
    o2: Int?;
    o3: Int?;
    o4: Bool?;
    o5: String?;
}

contract ManyOptDefaults {
    data: ManyOptionalDefaults;

    init() {
        self.data = ManyOptionalDefaults{
            o1: null,
            o2: null,
            o3: null,
            o4: null,
            o5: null
        };
    }
}
