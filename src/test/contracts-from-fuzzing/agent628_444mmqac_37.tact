struct SInner {
    val: Int;
}

struct SOuter {
    a: SInner;
    b: SInner;
}

contract ManyInnerStructs {
    nested: SOuter;

    init() {
        self.nested = SOuter{ a: SInner{val:1}, b: SInner{val:2} };
    }
}