struct Deep3 {
    z: Int;
}

struct Deep2 {
    y: Deep3;
}

struct Deep1 {
    x: Deep2;
}

contract DeeplyNested3Contract {
    deep: Deep1;
    
    init() {
        self.deep = Deep1{
            x: Deep2{
                y: Deep3{
                    z: 123
                }
            }
        };
    }
}
