struct L3 {
    x: Int = 3;
}

struct L2 {
    y: L3 = L3{};
}

struct L1 {
    z: L2 = L2{};
}

contract DeepDefaults {
    data: L1;
    init() {
        self.data = L1{};
    }
}