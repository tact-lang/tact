struct Inner {
    s: String;
    flag: Bool;
}

struct Outer {
    a: Int;
    b: Inner;
}

contract Test26 {
    val: Outer;
    init() {
        self.val = Outer{
            a:7,
            b: Inner{s:"hi",flag:false}
        };
    }
}