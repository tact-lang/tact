struct DefaultValues {
    x: Int = 5;
    y: Bool = true;
    z: String = "test";
}

contract StorageTest {
    data: DefaultValues;

    init() {
        self.data = DefaultValues{};
    }
}