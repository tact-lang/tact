struct L4 { x: Int; }
struct L3 { l4: L4; }
struct L2 { l3: L3; }
struct L1 { l2: L2; }

contract DeepNestedStructTest {
    deep: L1;

    init() {
        self.deep = L1{ l2: L2{ l3: L3{ l4: L4{ x: 99 } } } };
    }

    receive() {
        let tmp = self.deep;
    }
}