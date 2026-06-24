struct Deep3 {
    value: Int?;
}

struct Deep2 {
    d3: Deep3;
}

struct Deep1 {
    d2: Deep2;
}

contract TestContract {
    deep: Deep1;

    init() {
        self.deep = Deep1{
            d2: Deep2{
                d3: Deep3{
                    value: null
                }
            }
        };
    }
}