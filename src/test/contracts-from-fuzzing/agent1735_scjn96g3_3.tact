struct OptionalNested {
    first: Int?;
    second: NestedOpt?;
}

struct NestedOpt {
    inner1: Int?;
    inner2: Bool?;
    inner3: String?;
}

contract TestContract {
    storage: OptionalNested;

    init() {
        self.storage = OptionalNested{
            first: null,
            second: null
        };
    }
}
