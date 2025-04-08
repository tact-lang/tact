struct InnerStr {
    s: String?;
}

struct OuterStr {
    nested: InnerStr?;
}

contract NestedNullStrings {
    val: OuterStr;

    init() {
        self.val = OuterStr{
            nested: null
        };
    }
}