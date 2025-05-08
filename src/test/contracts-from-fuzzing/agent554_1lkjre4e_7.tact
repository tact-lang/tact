struct LeafPartial {
    flag: Bool;
    note: String?;
}

struct MidPartial {
    count: Int;
    detail: LeafPartial;
    remark: String?;
}

struct RootPartial {
    code: Int;
    info: MidPartial;
    value: Int?;
}

contract DeepPartialNested {
    root: RootPartial;

    init() {
        self.root = RootPartial{
            code: 9,
            info: MidPartial{
                count: 5,
                detail: LeafPartial{ flag: true, note: null },
                remark: "hello"
            },
            value: null
        };
    }
}