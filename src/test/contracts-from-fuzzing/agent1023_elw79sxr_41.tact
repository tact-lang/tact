struct SInner {
    x:Int;
    y:Bool;
}

struct SOptionalOuter {
    inner: SInner?;
}

contract OptionalStructs {
    outer: SOptionalOuter;
    init() {
        self.outer = SOptionalOuter{ inner:null };
    }
}