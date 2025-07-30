struct VeryDeep1 { val: Int }
struct VeryDeep2 { v: VeryDeep1 }
struct VeryDeep3 { v: VeryDeep2 }
struct VeryDeep4 { v: VeryDeep3 }
struct VeryDeep5 { v: VeryDeep4 }
struct VeryDeep6 { v: VeryDeep5 }

contract DeepChain {
    d: VeryDeep6;

    init() {
        self.d = VeryDeep6{ v: VeryDeep5{ v: VeryDeep4{ v: VeryDeep3{ v: VeryDeep2{ v: VeryDeep1{ val: 999 } }}}}};
    }
}