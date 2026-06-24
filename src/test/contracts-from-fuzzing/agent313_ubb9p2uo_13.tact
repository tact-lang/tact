struct MultiOptional {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract StructMultiOpt {
    val: MultiOptional;

    init() {
        self.val = MultiOptional{
            a: null,
            b: null,
            c: "str",
            d: 32,
            e: true,
            f: null
        };
    }
}