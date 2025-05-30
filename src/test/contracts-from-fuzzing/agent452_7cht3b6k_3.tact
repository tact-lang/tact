struct Deep1 { x: Int }
struct Deep2 { l1: Deep1 }
struct Deep3 { l2: Deep2 }
struct Deep4 { l3: Deep3 }

contract Test4 {
    val: Deep4;
    init() {
        self.val = Deep4{ l3: Deep3{ l2: Deep2{ l1: Deep1{ x: 999 } } } };
    }
}
