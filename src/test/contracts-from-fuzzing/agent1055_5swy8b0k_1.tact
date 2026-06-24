struct NestedOpt {
    x: Int?;
    y: Bool?;
}

contract DeepNestedTest {
    data: NestedOpt;
    init() {
        self.data = NestedOpt{ x: null, y: null };
    }
}