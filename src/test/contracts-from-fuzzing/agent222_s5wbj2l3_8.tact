struct NestedOptional {
    deep: Inner?;
}

struct Inner {
    value: Int?;
    flag: Bool?;
}

contract NestedOptionalsTest {
    data: NestedOptional;

    init() {
        self.data = NestedOptional{
            deep: Inner{
                value: null,
                flag: true
            }
        };
    }
}