struct Deep2 {
    sub: Int?;
}

struct Deep1 {
    nest: Deep2?;
}

contract Test {
    nested: Deep1;

    init() {
        self.nested = Deep1{
            nest: Deep2{
                sub: null
            },
        };
    }
}