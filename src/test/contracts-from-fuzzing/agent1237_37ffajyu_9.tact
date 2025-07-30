struct MultiNested {
    l1: String;
    l2: Nested2Opt;
}

struct Nested2Opt {
    l3: Inner3?;
    flag: Bool;
}

struct Inner3 {
    a: Int;
    b: String;
}

contract Test9 {
    m: MultiNested;

    init() {
        self.m = MultiNested{
            l1: "ok",
            l2: Nested2Opt{
                l3: null,
                flag: true
            }
        };
    }
}