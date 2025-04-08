struct VeryDeep1 { val: Int; }
struct VeryDeep2 { sub: VeryDeep1; }
struct VeryDeep3 { sub: VeryDeep2; }
struct VeryDeep4 { sub: VeryDeep3; }
struct VeryDeep5 { sub: VeryDeep4; }
struct VeryDeep6 { sub: VeryDeep5; }

contract ReallyDeepNested {
    d: VeryDeep6;
    init() {
        self.d = VeryDeep6{ sub: VeryDeep5{ sub: VeryDeep4{ sub: VeryDeep3{ sub: VeryDeep2{ sub: VeryDeep1{ val: 123 } } } } } };
    }
}