struct Outer {
    inner: Inner;
}

struct Inner {
    deep: Deep;
}

struct Deep {
    flag: Bool;
    num: Int;
    text: String;
    flag2: Bool;
}

contract TestContract {
    s: Outer;

    init() {
        self.s = Outer{inner: Inner{deep: Deep{flag:true, num:42, text:"hi", flag2:false}}};
    }
}