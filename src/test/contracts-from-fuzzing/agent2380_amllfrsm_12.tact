// deeply nested mix optional and non optional fields
struct L3 { val: Int; }
struct L2 { x: L3?; }
struct L1 { y: L2; }

contract TestContract {
    data: L1;
    init() {
        self.data = L1{ y: L2{ x: null } };
    }
}