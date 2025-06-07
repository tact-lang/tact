// Deeply nested optional structs
struct L3 { x: Int?; }
struct L2 { sub: L3?; }
struct L1 { sub: L2?; }

contract DeepOptionalNest {
    val: L1?;
    init() {
        self.val = null;
    }
}