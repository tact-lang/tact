struct SRepeat {
    a: Int;
    b: Int;
}

contract DuplicateStructTest {
    f1: SRepeat;
    f2: SRepeat;

    init() {
        self.f1 = SRepeat{ a:1,b:2 };
        self.f2 = SRepeat{ a:3,b:4 };
    }
}