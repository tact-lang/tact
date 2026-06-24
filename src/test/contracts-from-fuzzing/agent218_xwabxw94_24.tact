struct L3 { v: Int; }
struct L2 { l3: L3; }
struct L1 { l2: L2; }

contract DeepOneInt {
    val: L1;

    init() {
        self.val = L1{ l2: L2{ l3: L3{ v: 12345 } } };
    }
}