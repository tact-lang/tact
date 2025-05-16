struct OuterStr {
    nested: InnerStr;
}

struct InnerStr {
    optFld: Int?;
}

contract OptionalInNested {
    s: OuterStr = OuterStr{ nested: InnerStr{ optFld: null } };

    init() {
        self.s = OuterStr{ nested: InnerStr{ optFld: 11 } };
    }
}