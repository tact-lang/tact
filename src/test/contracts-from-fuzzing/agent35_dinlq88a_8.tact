struct OptionalNest {
    inner1: Int?;
    inner2: Bool?;
    inner3: String?;
}

struct ContainsOptionalNest {
    nested: OptionalNest?;
    val: Int;
}

contract TestContract {
    data: ContainsOptionalNest;

    init() {
        self.data = ContainsOptionalNest{
            nested: null,
            val: 100
        };
    }
}