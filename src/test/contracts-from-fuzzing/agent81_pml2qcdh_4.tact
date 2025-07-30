struct Deep3 {
    val: String;
}

struct Deep2 {
    deeper: Deep3;
}

struct Deep1 {
    deeper: Deep2;
}

contract Test {
    nested: Deep1;

    init() {
        self.nested = Deep1{
            deeper: Deep2{
                deeper: Deep3{
                    val: "deep"
                }
            }
        };
    }
}
