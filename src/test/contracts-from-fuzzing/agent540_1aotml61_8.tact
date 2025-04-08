struct BoolLayer {
    a: Bool;
    b: Bool;
    c: Bool;
    d: Bool;
}

contract ManyBools {
    flags: BoolLayer;

    init() {
        self.flags = BoolLayer{ a:true, b:false, c:true, d:false };
    }
}