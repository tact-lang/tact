struct L1 { f1: Int; f2: String?; }
struct L2 { s: L1; f3: Bool; }
struct L3 { m: L2; f4: Bool?; }

contract NestedWithOptionalTail {
    store: L3;

    init() {
        self.store = L3{
            m: L2{
                s: L1{ f1: 3, f2: null },
                f3: true
            },
            f4: false
        };
    }
}