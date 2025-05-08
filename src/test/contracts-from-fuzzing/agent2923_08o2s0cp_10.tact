struct Outer {
    inner1: Inner;
    inner2: Inner;
}

struct Inner {
    flag: Bool;
    count: Int;
}

contract TwoStructFields {
    val: Outer;

    init() {
        self.val = Outer{
            inner1: Inner{flag:true, count:1},
            inner2: Inner{flag:false, count:2}
        };
    }
}