struct BoolIntMix {
    a: Bool;
    b: Int;
    c: Bool;
    d: Int;
}

contract MixPersist {
    m: BoolIntMix;
    init() {
        self.m = BoolIntMix{ a:true, b:1, c:false, d:2 };
    }
}