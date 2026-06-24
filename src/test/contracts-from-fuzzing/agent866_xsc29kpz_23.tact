struct SBool {
    a: Bool;
    b: Bool;
}

contract TwoBools {
    flags: SBool;
    init() {
        self.flags = SBool{ a:true, b:false };
    }
}