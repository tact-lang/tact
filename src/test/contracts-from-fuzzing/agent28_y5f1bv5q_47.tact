struct Layers {
    l1: Int;
    l2: S1;
}

struct S1 {
    l1: Int;
    l2: S2;
}

struct S2 {
    l1: Int;
    l2: S3;
}

struct S3 {
    l1: Int;
    l2: S4;
}

struct S4 {
    l1: Int;
}

contract Test {
    val: Layers;

    init() {
        self.val = Layers{
            l1: 0,
            l2: S1{
                l1:1,
                l2: S2{
                    l1:2,
                    l2: S3{
                        l1:3,
                        l2: S4{l1:4}
                    }
                }
            }
        };
    }
}