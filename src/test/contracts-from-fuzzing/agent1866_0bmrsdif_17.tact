struct Rec {
    s: String;
    b: Bool;
    inner: Inner;
}

struct Inner {
    val: Int;
    opt: Bool?;
}

contract Recurse {
    field: Rec;

    init() {
        self.field = Rec{
            s:"hi",
            b:true,
            inner: Inner{val:42,opt:false},
        };
    }
}