message(99) MsgInner {
    val: Int;
}

struct Deep2 {
    x: MsgInner;
    y: Int;
}

struct Deep1 {
    inner: Deep2;
    flag: Bool;
}

contract TestContract {
    nest: Deep1 = Deep1{
        inner: Deep2{
            x: MsgInner{val:123},
            y: 456
        },
        flag: true
    };
    init() {}
}