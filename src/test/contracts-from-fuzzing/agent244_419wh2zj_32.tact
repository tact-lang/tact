// Deep nested with cross optional and non-optional fields
struct GrandLeaf {
    val: Int;
}

struct LeafWrap {
    leaf: GrandLeaf?;
    note: String;
}

struct MidWrap {
    nested: LeafWrap?;
    flag: Bool;
}

contract CrossNest {
    data: MidWrap;

    init() {
        self.data = MidWrap{
            nested: null,
            flag: true
        };
    }
}