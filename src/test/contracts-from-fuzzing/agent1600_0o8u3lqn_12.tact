struct StrNest {
    inner: String;
}

struct StrOuter {
    nested: StrNest;
}

contract StringNestContract {
    nestedStr: StrOuter;

    init() {
        self.nestedStr = StrOuter{
            nested: StrNest{inner: "ok"}
        };
    }
}