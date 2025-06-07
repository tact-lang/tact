struct StrNest {
    inner: String;
    optInner: String?;
}

contract StringStructStorage {
    nestedStr: StrNest;

    init() {
        self.nestedStr = StrNest{ inner: "abc", optInner: null };
    }
}