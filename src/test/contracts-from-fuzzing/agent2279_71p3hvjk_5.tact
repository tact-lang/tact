struct Deep3 {
    d: Int;
}

struct Deep2 {
    d3: Deep3;
}

struct Deep1 {
    d2: Deep2;
}

contract DeepChain {
    root: Deep1;

    init() {
        self.root = Deep1{
            d2: Deep2{
                d3: Deep3{ d: 777 }
            }
        };
    }
}