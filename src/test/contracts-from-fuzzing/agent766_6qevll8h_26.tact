// chained nested optionals inside nested structs
struct L4 { val: Int; }
struct L3 { nxt: L4?; }
struct L2 { nxt: L3?; }
struct L1 { nxt: L2?; }

contract Test {
    d: L1;

    init() {
        self.d = L1{ nxt: L2{ nxt: L3{ nxt: L4{ val: 111 } } } };
    }
}