struct L3 {
    z: String;
    flag: Bool;
}

struct L2 {
    mid: L3;
    x: Int;
}

struct L1 {
    inner: L2;
}

contract DeepDeepNested {
    data: L1;
    init() {
        self.data = L1{
            inner: L2{
                mid: L3{
                    z: "ok",
                    flag: true
                },
                x: 77
            }
        };
    }
}