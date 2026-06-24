struct Deep1 {
    x: Int;
}

struct Deep2 {
    inner: Deep1;
}

struct Deep3 {
    inner: Deep2;
}

contract DeepNest {
    d: Deep3;

    init() {
        self.d = Deep3{
            inner: Deep2{
                inner: Deep1{
                    x: 999
                }
            }
        };
    }
}