struct NestedOptionalsStruct {
    a: InnerOption?;
    b: InnerOption?;
}

struct InnerOption {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract NestedOptionalsTest {
    data: NestedOptionalsStruct;

    init() {
        self.data = NestedOptionalsStruct{
            a: null,
            b: null
        };
    }
}