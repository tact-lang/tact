struct StructWithStringDefault {
    msg: String = "hello";
}

contract StructWithDefaultStringTest {
    data: StructWithStringDefault;
    init() {
        self.data = StructWithStringDefault{};
    }
}