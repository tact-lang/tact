struct L3 {
    z: Int;
}

struct L2 {
    y: Bool;
    inner3: L3;
}

struct L1 {
    x: Int;
    inner2: L2;
}

contract DeepNested {
    data: L1;

    init() {
        self.data = L1{
            x: 1,
            inner2: L2{
                y: true,
                inner3: L3{ z: 42 }
            }
        };
    }
}