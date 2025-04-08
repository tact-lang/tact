struct L3 {
    x: Int = 5;
    y: String = "deep";
    z: Bool? = true;
}

struct L2 {
    foo: L3 = L3{};
    bar: Int = -1;
}

struct L1 {
    inner: L2 = L2{};
    flag: Bool = false;
}

contract Test {
    data: L1;

    init() {
        self.data = L1{};
    }
}