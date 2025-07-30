struct NestedOptional {
    id: Int?;
    meta: MetaData?;
}

struct MetaData {
    desc: String;
    valid: Bool;
}

contract TestContract {
    optfield: NestedOptional;

    init() {
        self.optfield = NestedOptional{
            id: null,
            meta: MetaData{ desc: "info", valid: true }
        };
    }
}