// nested multiple levels combined with optional
struct L3 { z: Int?; }
struct L2 { y: L3?; }
struct L1 { x: L2?; }

contract Test {
    root: L1?;
    init() { self.root = null; }
}