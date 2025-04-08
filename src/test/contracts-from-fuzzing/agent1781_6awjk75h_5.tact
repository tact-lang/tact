struct Deep {
    val: Int;
    flag: Bool;
    optInner: Inner?;
}

struct Inner {
    txt: String;
    flag2: Bool;
    veryInner: VeryInner;
}

struct VeryInner {
    i: Int;
    b: Bool;
}

contract NestedOptionals {
    x: Deep?;

    init() {
        self.x = null;
    }
}