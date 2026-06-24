struct InnerMost {
    x: Int = 99;
    y: Bool;
}

struct Mid {
    inner: InnerMost;
    label: String = "label";
}

contract StructDefaultsTest {
    data: Mid;

    init() {
        self.data = Mid{
            inner: InnerMost{
                y: true,
            },
        };
    }
}