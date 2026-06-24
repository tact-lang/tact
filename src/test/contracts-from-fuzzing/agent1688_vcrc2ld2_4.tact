struct Deep1 {
    value: Int;
}

struct Deep2 {
    deep1: Deep1;
}

struct Deep3 {
    deep2: Deep2;
}

struct Deep4 {
    deep3: Deep3;
}

contract TestContract {
    nested: Deep4;
    
    init() {
        self.nested = Deep4{
            deep3: Deep3{
                deep2: Deep2{
                    deep1: Deep1{
                        value: 77
                    }
                }
            }
        };
    }
}