struct NestedMany {
    a: Int;
    b: String;
    c: Inner;
    d: Bool;
}

struct Inner {
    q: Int;
    r: String;
    s: Bool;
    t: InnerMost;
}

struct InnerMost {
    flag: Bool;
    note: String;
    value: Int;
}

contract TestContract {
    field: NestedMany = NestedMany{
        a: 1,
        b: "b",
        c: Inner{
            q: 2,
            r: "r",
            s: true,
            t: InnerMost{ flag:false, note:"note", value:3 }
        },
        d: true
    };

    init() {
        self.field = NestedMany{
            a: 10,
            b: "bb",
            c: Inner{
                q: 20,
                r: "rr",
                s: false,
                t: InnerMost{ flag:true, note:"changed", value:30 }
            },
            d: false
        };
    }
}
