message(0x100) M1 { a: Int; }
message(0x101) M2 { b: Bool; }
message(0x102) M3 { t: String; }

contract MultiMsgStorage {
    f1: M1;
    f2: M2;
    f3: M3;
    fopt: M3?;

    init() {
        self.f1 = M1{ a: 10 };
        self.f2 = M2{ b: true };
        self.f3 = M3{ t: "hi" };
        self.fopt = null;
    }
}