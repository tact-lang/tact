struct STest {
    x: Int;
    y: Bool;
    s: String;
}

contract ArrayStyle {
    s0: STest;
    s1: STest;
    s2: STest;
    s3: STest;
    s4: STest;

    init() {
        self.s0 = STest{ x:0, y:false, s:"" };
        self.s1 = STest{ x:1, y:true, s:"1" };
        self.s2 = STest{ x:2, y:false, s:"2" };
        self.s3 = STest{ x:3, y:true, s:"3" };
        self.s4 = STest{ x:4, y:false, s:"4" };
    }
}