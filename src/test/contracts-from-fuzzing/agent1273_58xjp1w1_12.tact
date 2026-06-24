struct OptionalNested {
    content: String?;
    number: Int?;
    flag: Bool?;
}

struct WrapOpt {
    inner: OptionalNested?;
}

contract NestedOptionalsTest {
    data: WrapOpt;

    init() {
        self.data = WrapOpt{inner: null};
    }
}