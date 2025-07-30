struct L10 { final: Int; }
struct L9 { val: L10?; }
struct L8 { val: L9?; }
struct L7 { val: L8?; }
struct L6 { val: L7?; }
struct L5 { val: L6?; }
struct L4 { val: L5?; }
struct L3 { val: L4?; }
struct L2 { val: L3?; }
struct L1 { val: L2?; }

contract ExtremeDeepNullChain {
    root: L1?;

    init() {
        self.root = null;
    }
}