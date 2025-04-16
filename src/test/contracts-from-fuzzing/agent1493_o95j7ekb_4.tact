struct Deep2 {
    z: Int;
}

struct Deep1 {
    w: Int;
    deep2: Deep2;
}

struct Deep0 {
    v: Int;
    deep1: Deep1;
}

contract DeepChain {
    val: Deep0;

    init() {
        self.val = Deep0 {
            v: 1,
            deep1: Deep1 {
                w: 2,
                deep2: Deep2 {
                    z: 3
                }
            }
        };
    }
}
