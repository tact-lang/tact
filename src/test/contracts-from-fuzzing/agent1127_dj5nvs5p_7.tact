struct NestedOptionals {
    s: String?;
    b: Bool?;
    n: Int?;
}

contract OptTest {
    data: NestedOptionals?;

    init() {
        self.data = null;
    }
}
