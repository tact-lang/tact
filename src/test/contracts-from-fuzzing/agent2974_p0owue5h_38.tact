// deeply nested multi-level structs, optional middle
struct L1 { v: Int }
struct L2 { mid: L1?; flag: Bool }
struct L3 { top: L2; tail: Int }

contract TestContract {
    data: L3;

    init() {
        self.data = L3 {
            top: L2 { mid: null, flag: true },
            tail: 0,
        };
    }
}