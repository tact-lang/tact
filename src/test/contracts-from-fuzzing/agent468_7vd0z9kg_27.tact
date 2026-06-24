// Chain of nested structs with deep layers and all defaults
struct L3 {
    a: Int = 3;
    b: Bool = true;
}

struct L2 {
    l3: L3 = L3{};
    s: String = "x";
}

struct L1 {
    l2: L2 = L2{};
    opt: Int?;
}

contract DeepDefaults {
    val: L1;

    init() {
        self.val = L1{};
    }
}