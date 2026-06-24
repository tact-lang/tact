// Very deep chain of nested structs
struct L5 { z: Int; }
struct L4 { s: L5; }
struct L3 { s: L4; }
struct L2 { s: L3; }
struct L1 { s: L2; }

contract TestContract {
    val: L1;

    init() {
        self.val = L1{ s: L2{ s: L3{ s: L4{ s: L5{ z: 42 } } } } };
    }
}