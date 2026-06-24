struct OneBool {
    a: Bool;
}
struct TwoBool {
    a: Bool;
    b: Bool;
}
struct ThreeBool {
    a: Bool;
    b: Bool;
    c: Bool;
}

contract BoolVariants {
    o: OneBool;
    t: TwoBool;
    th: ThreeBool;
    
    init() {
        self.o = OneBool{ a: true };
        self.t = TwoBool{ a: true, b: false };
        self.th = ThreeBool{ a: true, b: false, c: true };
    }
}