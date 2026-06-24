struct DeepDefault {
    innerVal: Int? = null;
    flag: Bool = true;
}

contract DefaultsTest {
    data: DeepDefault;
    init() {
        self.data = DeepDefault{};
    }
}