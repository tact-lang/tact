struct Inner {
    a: Int;
    b: Bool;
}

contract FieldOrder {
    f2: Int = 2;
    f1: Inner;
    f3: Bool = true;

    init() {
        self.f1 = Inner{a:1,b:false};
    }
}