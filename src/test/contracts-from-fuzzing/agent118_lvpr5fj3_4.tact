struct Deep3 {
    val: Int;
}

struct Deep2 {
    deeper: Deep3;
}

struct Deep1 {
    deeper: Deep2;
}

contract DeepNest {
    data: Deep1;

    init() {
        self.data = Deep1{
            deeper: Deep2{
                deeper: Deep3{
                    val: 123
                }
            }
        };
    }
}