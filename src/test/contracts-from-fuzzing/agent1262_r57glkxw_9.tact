struct NestedOptionals {
    a: Int?;
    b: String?;
    c: Bool?;
}

contract TwoLayerOptionalTest {
    data: NestedOptionals?;

    init() {
        self.data = null;
    }
}