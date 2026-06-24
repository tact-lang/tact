struct InnerA {
    f: Bool;
}
struct InnerB {
    x: Int;
}

contract MixDefaultAndNone {
    a: InnerA? = null;
    b: InnerB;

    init() {
        self.a = null;
        self.b = InnerB{x:5};
    }
}