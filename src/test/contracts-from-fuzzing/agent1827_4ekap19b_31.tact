struct NestedStringDefOpt {
    s1: String? = null;
    s2: String? = null;
    s3: String? = null;
}

contract NestedStringDefOptContract {
    field: NestedStringDefOpt;

    init() {
        self.field = NestedStringDefOpt{};
    }
}