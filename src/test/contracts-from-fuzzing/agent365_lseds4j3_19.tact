struct L3 { y: Int; }
struct L2 { l3: L3; }
struct L1 { l2: L2; }

contract MultiLayers {
    lvl: L1;

    init() {
        self.lvl = L1{ l2: L2{ l3: L3{ y: 999 } } };
    }
}