struct EmptyOptDefaultTest {
    n: Int?;
    b: Bool? = null;
    s: String? = null;
}

contract EmptyOptDefault {
    data: EmptyOptDefaultTest;

    init() {
        self.data = EmptyOptDefaultTest{};
    }
}