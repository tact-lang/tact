struct Inner {
    x: Int;
}

struct Outer {
    innerObj: Inner;
    optInner: Inner?;
    flag: Bool;
    strVal: String;
}

contract MyContract {
    stored: Outer;

    init() {
        self.stored = Outer{
            innerObj: Inner{x:1},
            optInner: null,
            flag: false,
            strVal: "hello"
        };
    }
}