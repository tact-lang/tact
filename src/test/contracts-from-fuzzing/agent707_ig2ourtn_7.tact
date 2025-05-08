struct Inner {
    val: Int;
    flag: Bool;
}

struct Outer {
    a: Inner;
    b: Inner;
    c: Inner;
}

contract RepeatedNestedInner {
    data: Outer;
    init() {
        self.data = Outer{
            a: Inner{ val:1, flag:true },
            b: Inner{ val:2, flag:false },
            c: Inner{ val:3, flag:true }
        };
    }
}