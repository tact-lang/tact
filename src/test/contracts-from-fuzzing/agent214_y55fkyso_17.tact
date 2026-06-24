struct AData {
    a: Int;
    b: Int;
    c: Int;
}

struct BData {
    d: String;
    e: Bool;
    f: Int;
}

contract MixedStructFields {
    m: AData;
    n: BData;

    init() {
        self.m = AData{a:1,b:2,c:3};
        self.n = BData{d:"hi", e:true, f:4};
    }
}
