struct StrBoolOpt {
    s: String?;
    b: Bool?;
}

contract NestedStrBoolOpt {
    val: StrBoolOpt;

    init() {
        self.val = StrBoolOpt{
            s: null,
            b: true
        };
    }
}