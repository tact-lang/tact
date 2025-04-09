struct InnerSer {
    x: Int as uint32 = 123;
    y: Bool = true;
}

struct OuterSer {
    a: Int = 5;
    b: InnerSer = InnerSer{};
    c: Bool = false;
}

contract TestContract {
    packed: OuterSer = OuterSer{};

    init() {
        self.packed = OuterSer{};
    }
}