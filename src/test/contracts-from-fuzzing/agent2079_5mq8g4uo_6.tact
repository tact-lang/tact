struct BigNest {
    i1: Int;
    s: String;
    nested: Inner?;
}

struct Inner {
    flag: Bool;
    num: Int?;
    text: String;
}

contract TestContract {
    root: BigNest;

    init() {
        self.root = BigNest{
            i1: 5,
            s: "ok",
            nested: Inner{flag: true, num: null, text: "deep"}
        };
    }
}