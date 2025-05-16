struct L5 { d5: Int?; }
struct L4 { d4: L5; }
struct L3 { d3: L4; }
struct L2 { d2: L3; }
struct L1 { d1: L2; }

contract MaxDepth {
    deep: L1;
    init() {
        self.deep = L1{ d1: L2{ d2: L3{ d3: L4{ d4: L5{ d5: 99 } } } } };
    }
}