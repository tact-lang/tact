struct L3 {
    z: Int = 9;
    q: Bool?;
}

struct L2 {
    y: L3 = L3{};
    w: Bool = true;
}

struct L1 {
    x: L2 = L2{};
    r: Int?;
}

contract Test {
    data: L1;

    init() {
        self.data = L1{};
    }
}