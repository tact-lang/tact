struct OptTest {
    val: Int? = 5;
}

contract Test {
    field: OptTest = OptTest{};
    init() {
        self.field = OptTest{ val: null };
    }
}