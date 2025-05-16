struct Inner {
    x: Int;
    y: Bool;
}

struct Middle {
    inner1: Inner;
    inner2: Inner;
}

contract MultiNestedStorage {
    m: Middle;

    init() {
        self.m = Middle{ inner1: Inner{ x:1, y:true }, inner2: Inner{ x:2, y:false } };
    }
}