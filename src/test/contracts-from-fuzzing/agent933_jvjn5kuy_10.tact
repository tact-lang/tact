struct InnerMost { v: Int; }

struct InnerMid {
    optionalInner: InnerMost?;
    name: String;
}

struct OuterMid {
    mid: InnerMid;
    flag: Bool;
}

contract NestedStructOptions {
    field: OuterMid;

    init() {
        self.field = OuterMid{
            mid: InnerMid{optionalInner: null, name: "abc"},
            flag: false
        };
    }
}
