// deeply nested mix of serialize annotations
struct L3 {
    x: Int as int8;
    y: Int as uint4;
}

struct L2 {
    inner: L3;
}

struct L1 {
    deep: L2;
    flag: Bool;
}

contract DeepSerialize {
    data: L1;

    init() {
        self.data = L1{
            deep: L2{
                inner: L3{
                    x: -3,
                    y: 12
                }
            },
            flag: true
        };
    }
}