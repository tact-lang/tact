struct L5 { a: Int; b: Bool; }
struct L4 { child: L5; }
struct L3 { child: L4; }
struct L2 { child: L3; }
struct L1 { child: L2; }

contract TestContract {
    data: L1;

    init() {
        self.data = L1{child: L2{child: L3{child: L4{child: L5{a: 42, b: true}}}}};
    }
}