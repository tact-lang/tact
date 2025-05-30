struct OptZero {
    val: Int? = 0;
}

contract OptZeroTest {
    rec: OptZero;
    init() {
        self.rec = OptZero{};
    }
}