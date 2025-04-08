struct Deep3 {
    z: String;
}

struct Deep2 {
    y: Bool;
    d3: Deep3;
}

struct Deep1 {
    x: Int;
    d2: Deep2;
}

contract TestContract {
    deep: Deep1;

    init() {
        self.deep = Deep1{
            x: 42,
            d2: Deep2{
                y: false,
                d3: Deep3{
                    z: "deep",
                },
            },
        };
    }
}