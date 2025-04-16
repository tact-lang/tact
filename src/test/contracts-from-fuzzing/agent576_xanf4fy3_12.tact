struct L4 { val: Int; }
struct L3 { next: L4; }
struct L2 { next: L3; }
struct L1 { next: L2; }

contract FourDeep {
    deep: L1;

    init() {
        self.deep = L1{ next: L2{ next: L3{ next: L4{ val: 123 } } } };
    }
}
