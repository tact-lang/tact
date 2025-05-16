struct InnerMost {
    x: Int;
    y: Bool;
    s: String;
}

struct Mid {
    inner: InnerMost;
    flag: Bool?;
    note: String?;
}

struct Outer {
    top: Int;
    mid: Mid;
    comment: String?;
}

contract NestedMixed {
    storage: Outer;
    init() {
        self.storage = Outer{
            top: 5,
            mid: Mid{
                inner: InnerMost{x:1,y:true,s:"test"},
                flag: null,
                note: "note"
            },
            comment: null
        };
    }
}