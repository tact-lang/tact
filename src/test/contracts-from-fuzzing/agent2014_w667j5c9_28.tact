struct OuterMost {
    field1: Int;
    field2: InnerMid;
    field3: Bool;
}

struct InnerMid {
    inner: InnerMost;
    flag: Bool;
}

struct InnerMost {
    val: Int;
}

contract DeepStructs {
    s: OuterMost;

    init() {
        self.s = OuterMost{
            field1: 1,
            field2: InnerMid{
                inner: InnerMost{ val: 42 },
                flag: false
            },
            field3: true
        };
    }
}