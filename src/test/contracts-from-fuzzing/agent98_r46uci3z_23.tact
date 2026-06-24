struct BoolPack {
    b1: Bool;
    b2: Bool;
    b3: Bool;
    b4: Bool;
    b5: Bool;
}

struct IntPack {
    i1: Int;
    i2: Int;
    i3: Int;
    i4: Int;
    i5: Int;
}

struct StringPack {
    s1: String;
    s2: String;
    s3: String;
    s4: String;
    s5: String;
}

contract ManyPacked {
    b: BoolPack;
    i: IntPack;
    s: StringPack;
    
    init() {
        self.b = BoolPack{b1: true, b2: false, b3: true, b4: false, b5: true};
        self.i = IntPack{i1: 1, i2: 2, i3: 3, i4: 4, i5: 5};
        self.s = StringPack{s1: "a", s2: "b", s3: "c", s4: "d", s5: "e"};
    }
}