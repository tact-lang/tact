struct OptionalsOnly {
    x: Int?;
    y: String?;
    z: Bool?;
}

contract StorageTest {
    data: OptionalsOnly;

    init() {
        self.data = OptionalsOnly{
            x: null,
            y: null,
            z: null
        };
    }
}