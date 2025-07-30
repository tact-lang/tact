struct L3 {
    f1: Bool = false;
    n1: Int as uint8 = 0;
}

struct L2 {
    nestedL3: L3;
    optVal: Int? = null;
}

struct L1 {
    info: String = "default";
    nestedL2: L2;
}

contract DeepThreeNested {
    data: L1 = L1{
        info: "hi",
        nestedL2: L2{
            nestedL3: L3{ f1: true, n1: 255 },
            optVal: 42
        }
    };

    init() {
        self.data = L1{
            info: "changed",
            nestedL2: L2{
                nestedL3: L3{ f1: false, n1: 1 },
                optVal: null
            }
        };
    }
}