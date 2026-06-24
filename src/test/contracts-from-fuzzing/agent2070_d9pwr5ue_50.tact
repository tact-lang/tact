struct NestedOptions {
    inner: InnerOptions?;
}

struct InnerOptions {
    val: Int?;
    flag: Bool?;
}

contract ContractNestedOpt {
    field: NestedOptions;

    init() {
        self.field = NestedOptions{
            inner: InnerOptions{
                val: null,
                flag: null
            }
        };
    }
}