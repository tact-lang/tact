struct NestedOpt {
    sub: InnerOpt;
}

struct InnerOpt {
    val1: Int?;
    val2: Bool?;
}

contract NestedOptionalStorage {
    info: NestedOpt;

    init() {
        self.info = NestedOpt{
            sub: InnerOpt{
                val1: null,
                val2: null
            }
        };
    }
}
