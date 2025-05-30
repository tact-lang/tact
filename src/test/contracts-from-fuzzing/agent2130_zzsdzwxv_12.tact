struct L3 {
    k: Int as uint8 = 1;
    s: String?;
}

struct L2 {
    t: L3;
    b: Bool = true;
}

struct L1 {
    inner: L2?;
}

contract Test {
    data: L1 = L1{};

    init() {
        self.data = L1{ inner: L2{ t: L3{ k: 5, s: "hi" }, b: false } };
    }
}