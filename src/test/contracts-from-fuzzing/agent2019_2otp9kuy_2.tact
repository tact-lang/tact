struct Inner {
    val: Int;
    opt: String?;
}

struct Middle {
    i: Inner;
    flag: Bool;
}

struct Outer {
    mid: Middle;
    descr: String;
}

contract DeepNest {
    field: Outer;

    init() {
        self.field = Outer{
            mid: Middle{
                i: Inner{ val: 5, opt: null },
                flag: true
            },
            descr: "desc"
        };
    }
}