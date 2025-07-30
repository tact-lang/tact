struct NestedOptionWrapper {
    x: Int?;
    y: InnerWrapper?;
}

struct InnerWrapper {
    z: Bool?;
}

contract NestedOptWrapTest {
    data: NestedOptionWrapper;
    init() {
        self.data = NestedOptionWrapper{
            x: null,
            y: null,
        };
    }
}