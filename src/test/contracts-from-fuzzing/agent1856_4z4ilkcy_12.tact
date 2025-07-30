struct BigNested {
    s: String;
    opt: Int?;
    flag: Bool;
}

struct HasBig {
    bigNested: BigNested;
}

contract NestedInField {
    rec: HasBig;

    init() {
        self.rec = HasBig{
            bigNested: BigNested{
                s: "hi",
                opt: null,
                flag: false
            }
        };
    }
}
