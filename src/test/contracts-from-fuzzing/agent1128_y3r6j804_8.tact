struct L4 { v: Int = 1; }
struct L3 { inner: L4 = L4{}; }
struct L2 { inner: L3 = L3{}; }
struct L1 { inner: L2 = L2{}; }

contract DeeperNestTest {
    data: L1 = L1{};
}