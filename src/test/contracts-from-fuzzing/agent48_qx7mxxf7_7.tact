struct InnerMost {
    flag: Bool;
}

struct InnerMid {
    val: InnerMost;
    comment: String;
}

struct OuterMost {
    data: InnerMid;
    note: String;
}

contract NestedStructs {
    myData: OuterMost;

    init() {
        self.myData = OuterMost{
            data: InnerMid{
                val: InnerMost{ flag: true },
                comment: "deep enough"
            },
            note: "outer"
        };
    }
}
