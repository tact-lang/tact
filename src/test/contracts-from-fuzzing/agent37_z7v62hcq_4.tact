struct Deep3 {
    z: String;
}

struct Deep2 {
    y: Deep3;
}

struct Deep1 {
    x: Deep2;
}

contract Test {
    nested: Deep1;
    init() {
        self.nested = Deep1{
            x: Deep2{
                y: Deep3{
                    z: "hello",
                },
            },
        };
    }
}