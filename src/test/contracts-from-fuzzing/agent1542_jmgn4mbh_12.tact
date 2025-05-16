struct L3 { v: String = "ok"; }
struct L2 { l3: L3; n: Int = 42; }
struct L1 { l2: L2; flag: Bool; }

contract Test {
    deep: L1;

    init() {
        self.deep = L1{
            l2: L2{ l3: L3{}, n: 123 },
            flag: true
        };
    }
}