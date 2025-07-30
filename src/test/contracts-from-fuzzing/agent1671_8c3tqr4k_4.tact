struct Deep3 {
    v: String;
}

struct Deep2 {
    d3: Deep3;
}

struct Deep1 {
    d2: Deep2;
}

contract Test {
    d1: Deep1;

    init() {
        self.d1 = Deep1{
            d2: Deep2{
                d3: Deep3{
                    v: "hello",
                }
            }
        };
    }
}