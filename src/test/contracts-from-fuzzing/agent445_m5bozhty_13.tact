struct VeryDeep1 { v: Int }
struct VeryDeep2 { d1: VeryDeep1 }
struct VeryDeep3 { d2: VeryDeep2 }
struct VeryDeep4 { d3: VeryDeep3 }
struct VeryDeep5 { d4: VeryDeep4 }

contract Depth5 {
    val: VeryDeep5;
    init() {
        self.val = VeryDeep5{ d4: VeryDeep4{ d3: VeryDeep3{ d2: VeryDeep2{ d1: VeryDeep1{ v: 7 }}}}};
    }
}