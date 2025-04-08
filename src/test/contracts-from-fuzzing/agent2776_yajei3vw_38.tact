struct OptionStruct {
    x: Int = 5;
    y: Int?;
    z: Bool?;
}

contract OptStructTest {
    val: OptionStruct;

    init() {
        self.val = OptionStruct{};
    }
}
