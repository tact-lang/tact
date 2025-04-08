struct BadOptDefault {
    val: Int? as uint8 = -1;
}

contract BadOptDefaultTest {
    data: BadOptDefault;

    init() {
        self.data = BadOptDefault{};
    }
}