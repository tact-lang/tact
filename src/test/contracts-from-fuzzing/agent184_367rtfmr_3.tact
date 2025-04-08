struct Deep3 {
    leaf: Int;
}

struct Deep2 {
    inner: Deep3;
}

struct Deep1 {
    middle: Deep2;
}

contract DeepNest {
    root: Deep1;

    init() {
        self.root = Deep1{
            middle: Deep2{
                inner: Deep3{
                    leaf: 777
                }
            }
        };
    }
}