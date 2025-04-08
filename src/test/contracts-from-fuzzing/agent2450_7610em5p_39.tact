// Contract with deeply nested optional struct chain set null
struct I3 { c: Int?; }
struct I2 { b: I3?; }
struct I1 { a: I2?; }

contract MultiNullChain {
    s: I1?;
    init() {
        self.s = null;
    }
}
