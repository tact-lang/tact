struct MultiLevelDefaults {
    a: Int = 1;
    b: Bool = true;
    s: String = "ok";
}

contract MultiDefaults {
    rec: MultiLevelDefaults;

    init() {
        self.rec = MultiLevelDefaults{};
    }
}