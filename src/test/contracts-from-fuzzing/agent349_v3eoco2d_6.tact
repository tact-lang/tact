contract Layers {
    s: S1;

    init() {
        self.s = S1{
            layer2: S2{
                layer3: S3{
                    finalVal: 999
                }
            }
        };
    }
}

struct S1 {
    layer2: S2;
}

struct S2 {
    layer3: S3;
}

struct S3 {
    finalVal: Int;
}