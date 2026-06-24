// very large optional chain assigned to null explicitly
struct L1 { f: Int?; }
struct L2 { f: L1?; }
struct L3 { f: L2?; }
struct L4 { f: L3?; }
struct L5 { f: L4?; }
struct L6 { f: L5?; }
struct L7 { f: L6?; }

contract Test {
    bigOpt: L7?;

    init() {
        self.bigOpt = null;
    }
}