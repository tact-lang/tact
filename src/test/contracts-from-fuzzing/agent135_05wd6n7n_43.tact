struct SBoolDef {
    a: Bool = false;
    b: Bool = true;
}

contract SBoolDefTest {
    p: SBoolDef;

    init() {
        self.p = SBoolDef{
        };
    }
}
