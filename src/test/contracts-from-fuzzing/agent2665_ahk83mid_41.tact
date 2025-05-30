struct DeepDefaults {
    a: Int = 1;
}

struct L2 {
    d: DeepDefaults = DeepDefaults{};
}

struct L1 {
    e: L2 = L2{};
}

contract DeepDefaultsChain {
    data: L1 = L1{};
}