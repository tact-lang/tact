struct NestedOpt {
    field1: Int?;
    field2: Bool?;
}

contract SimpleNestedOpt {
    val: NestedOpt;

    init() {
        self.val = NestedOpt{
            field1: null,
            field2: null
        };
    }
}
