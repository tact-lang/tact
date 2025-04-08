struct Deep1 { x: Int }
struct Deep2 { y: Deep1 }
struct Deep3 { z: Deep2 }
struct Deep4 { w: Deep3 }

contract VeryDeep {
    val: Deep4;

    init() {
        self.val = Deep4{ w: Deep3{ z: Deep2{ y: Deep1{ x: 123 }}}};
    }
}