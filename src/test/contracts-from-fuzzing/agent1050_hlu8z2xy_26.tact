struct BoolIntMix {
    a: Bool;
    b: Int;
    c: Bool;
    d: Int;
    e: Bool;
    f: Int;
}

contract MixedTypes {
    val: BoolIntMix;

    init() {
        self.val = BoolIntMix{
            a:true, b:1, c:false, d:2, e:true, f:3
        };
    }
}
