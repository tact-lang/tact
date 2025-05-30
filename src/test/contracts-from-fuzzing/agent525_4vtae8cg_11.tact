struct Deep1 { f: Int }
struct Deep2 { x: Deep1 }
struct Deep3 { y: Deep2 }
struct Deep4 { z: Deep3 }
contract DeepChain {
    val: Deep4;
    init() {
        self.val = Deep4{ z: Deep3{ y: Deep2{ x: Deep1{ f: 42 } } } };
    }
}