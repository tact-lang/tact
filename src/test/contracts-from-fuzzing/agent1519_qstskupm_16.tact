struct NestedOpt {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract OptStructNullTest {
    data: NestedOpt?;

    init() {
        self.data = null;
    }
}