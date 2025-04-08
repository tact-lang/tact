struct ConstString {
    val: String = "constant string";
}

contract ConstStrTest {
    data: ConstString;

    init() {
        self.data = ConstString{};
    }
}