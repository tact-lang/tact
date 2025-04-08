struct DeepDefaults {
    l1: L1;
}

struct L1 {
    l2: L2;
}

struct L2 {
    val: Int = 10;
}

contract TestContract {
    deep: DeepDefaults;
    init() {
        self.deep = DeepDefaults{l1: L1{l2: L2{}}};
    }
}