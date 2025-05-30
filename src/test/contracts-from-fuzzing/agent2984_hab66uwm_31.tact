struct Innermost {
    a: Int; b: Int?;
}
struct InnerWrap {
    x: Int?; y: Innermost;
}
contract Test32 {
    w: InnerWrap;
    init() {
        self.w = InnerWrap{ x:null, y: Innermost{ a:8, b:null } };
    }
}
