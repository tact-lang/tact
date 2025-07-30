struct Inner {
    val: Int;
    txt: String;
    ok: Bool;
}

struct Container {
    i1: Inner;
    i2: Inner;
    flag: Bool;
    msg: String;
}

contract NestedStructs {
    val: Container;

    init() {
        self.val = Container{
            i1: Inner{ val:1, txt:"a", ok:true },
            i2: Inner{ val:2, txt:"b", ok:false },
            flag: true,
            msg: "ok"
        };
    }
}