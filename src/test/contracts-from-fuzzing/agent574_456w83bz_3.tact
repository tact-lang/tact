struct Deep2 {
    flag: Bool;
}

struct Deep1 {
    inner2: Deep2;
}

struct Deep {
    inner1: Deep1;
}

contract DeepNested {
    data: Deep;

    init() {
        self.data = Deep{
            inner1: Deep1{
                inner2: Deep2{ flag: true }
            }
        };
    }
}