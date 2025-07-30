struct Deep3 {
    x: Int;
    y: Bool;
}

struct Deep2 {
    z: Deep3;
    opt: Bool?;
}

struct Deep1 {
    nested: Deep2;
    txt: String;
}

contract Test {
    storage: Deep1;

    init() {
        self.storage = Deep1{
            nested: Deep2{
                z: Deep3{
                    x: 1,
                    y: true,
                },
                opt: null
            },
            txt: "nest"
        };
    }
}
