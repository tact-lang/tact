struct CompositeDefaults {
    x: Int = 5;
    y: String = "abc";
    z: Bool = true;
}

contract CompositeDefaultsTest {
    data: CompositeDefaults;

    init() {
        self.data = CompositeDefaults{};
    }
}