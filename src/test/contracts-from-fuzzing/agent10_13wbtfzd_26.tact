struct DeeplyNested1 {
    v: Int;
}

struct DeeplyNested2 {
    s: DeeplyNested1;
}

struct DeeplyNested3 {
    y: DeeplyNested2;
}

struct DeeplyNested4 {
    z: DeeplyNested3;
}

contract FourLevel {
    data: DeeplyNested4;

    init() {
        self.data = DeeplyNested4{
            z: DeeplyNested3{
                y: DeeplyNested2{
                    s: DeeplyNested1{
                        v: 123
                    }
                }
            }
        };
    }
}
