struct Inner {
    str: String = "inner";
    num: Int = 5;
}

struct Outer {
    optInner: Inner?;
    flag: Bool;
}

contract DefaultInsideOpt {
    val: Outer;

    init() {
        self.val = Outer{
            optInner: null,
            flag: true
        };
    }
}