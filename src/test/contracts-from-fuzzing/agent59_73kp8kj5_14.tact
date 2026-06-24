struct OptionalDeeper {
    value: Int;
    flag: Bool;
    info: DeeperInfo?;
}

struct DeeperInfo {
    desc: String;
    note: String?;
}

contract NullableNestedOpt {
    nested: OptionalDeeper?;

    init() {
        self.nested = OptionalDeeper {
            value: 5,
            flag: false,
            info: DeeperInfo { desc: "desc", note: null }
        };
    }
}
