struct LeafDeep {
    vii: Int;
    vbool: Bool;
    vstr: String;
}

struct MiddleDeep {
    count: Int;
    leaf: LeafDeep;
}

struct TopLevel {
    name: String;
    m: MiddleDeep;
}

contract DeepPlainStructs {
    data: TopLevel;

    init() {
        self.data = TopLevel{
            name: "hi",
            m: MiddleDeep{
                count: 55,
                leaf: LeafDeep{
                    vii: 100,
                    vbool: true,
                    vstr: "deepest"
                }
            }
        };
    }
}