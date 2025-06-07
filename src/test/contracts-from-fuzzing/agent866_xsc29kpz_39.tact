struct SBool {
    a: Bool;
    b: Bool;
    c: Bool;
}

struct WrapBools {
    x: SBool;
}

contract TrioBools {
    wrapped: WrapBools;
    init() {
        self.wrapped = WrapBools{
            x: SBool { a:true, b:false, c:true }
        };
    }
}