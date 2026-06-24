struct ManyOptionalsZeroDefaults {
    o1: Int?;
    o2: Int?;
    o3: Bool?;
    o4: String?;
}

contract OptZeroDefaults {
    data: ManyOptionalsZeroDefaults;

    init() {
        self.data = ManyOptionalsZeroDefaults{
            o1: null,
            o2: null,
            o3: null,
            o4: null
        };
    }
}