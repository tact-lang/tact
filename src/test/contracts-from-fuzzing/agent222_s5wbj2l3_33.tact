struct BadStruct {
    s: BadStructInner?;
}

struct BadStructInner {
    a: Int;
    b: Bool;
}

contract NullBad {
    x: BadStruct = BadStruct{ s: null };
    y: BadStructInner;

    init() {
        self.y = BadStructInner{ a:1, b:true };
    }
}