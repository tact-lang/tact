struct Deep3 {
    c: String;
}

struct Deep2 {
    b: Deep3;
}

struct Deep1 {
    a: Deep2;
}

contract DeepNestTest {
    storage: Deep1;

    init() {
        self.storage = Deep1{
            a: Deep2{
                b: Deep3{
                    c: "deep string",
                },
            },
        };
    }
}