struct SInt {
    a: Int;
}

struct SBool {
    b: Bool;
}

struct SStr {
    s: String;
}

struct SAddr {
    addr: Address;
}

contract DiffTypes {
    f1: SInt;
    f2: SBool;
    f3: SStr;
    f4: SAddr;

    init() {
        self.f1 = SInt{a:1};
        self.f2 = SBool{b:true};
        self.f3 = SStr{s:"hi"};
        self.f4 = SAddr{addr: myAddress()};
    }
}