struct OptionalsOnly {
    x: Int?;
    y: String?;
    z: Bool?;
}

contract StorageTest {
    maybe: OptionalsOnly?;

    init() {
        self.maybe = null;
    }
}