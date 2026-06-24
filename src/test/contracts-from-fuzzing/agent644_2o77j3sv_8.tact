struct MultiLevelDefaults {
    a: Int = 1;
    b: Bool = true;
    c: Int?; 
    d: Bool?;
}

contract DefaultValsTest {
    vals: MultiLevelDefaults;

    init() {
        self.vals = MultiLevelDefaults{};
    }
}