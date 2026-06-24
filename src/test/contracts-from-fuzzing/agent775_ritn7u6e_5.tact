struct Leaf {
    v: Int;
    flag: Bool;
}

struct Middle {
    data: Int;
    leaf: Leaf?;
}

struct Top {
    ready: Bool;
    mid: Middle?;
}

contract DeepNested {
    var1: Top = Top{
        ready: true,
        mid: Middle{
            data: 42,
            leaf: Leaf{
                v: 99,
                flag: false,
            },
        },
    };

    init() {
        self.var1 = self.var1;
    }
}