struct FlagWrap {
    ok: Bool;
    nested: Bool?;
}

contract BoolOpts {
    val: FlagWrap;

    init() {
        self.val = FlagWrap{
            ok: true,
            nested: null
        };
    }
}