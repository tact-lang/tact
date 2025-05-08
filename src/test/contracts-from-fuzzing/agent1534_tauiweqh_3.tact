struct Deep1 {
    f1: Int;
    f2: Bool;
}

struct Deep2 {
    d1: Deep1;
    f3: String;
}

struct Deep3 {
    d2: Deep2;
    f4: Int?;
}

contract TestContract {
    deep: Deep3;

    init() {
        self.deep = Deep3{
            d2: Deep2{
                d1: Deep1{
                    f1: 7,
                    f2: false,
                },
                f3: "deep",
            },
            f4: null,
        };
    }
}