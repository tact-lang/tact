struct InnerL1 {
    f: Int;
}

struct InnerL2 {
    x: InnerL1;
    y: InnerL1;
}

struct InnerL3 {
    z: InnerL2;
    w: InnerL2;
}

contract DeepWideNesting {
    data: InnerL3;

    init() {
        self.data = InnerL3{
            z: InnerL2{
                x: InnerL1{f:1}, y: InnerL1{f:2}
            },
            w: InnerL2{
                x: InnerL1{f:3}, y: InnerL1{f:4}
            }
        };
    }
}