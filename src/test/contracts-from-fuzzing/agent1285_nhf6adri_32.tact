struct L5 { val: Int?; }
struct L4 { n: L5?; }
struct L3 { n: L4?; }
struct L2 { n: L3?; }
struct L1 { n: L2?; }

contract TestContract {
    deep: L1?;
    init() {
        self.deep = L1{};
    }
}