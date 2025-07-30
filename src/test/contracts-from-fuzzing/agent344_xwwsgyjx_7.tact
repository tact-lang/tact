struct Deep3 {
    z: Int;
    opt: String?;
}

struct Deep2 {
    y: Deep3;
}

struct Deep1 {
    x: Deep2;
}

contract NestedDepth3 {
    dd: Deep1;

    init() {
        self.dd = Deep1 {
            x: Deep2 {
                y: Deep3 {
                    z: 42,
                    opt: "hey"
                }
            }
        };
    }
}