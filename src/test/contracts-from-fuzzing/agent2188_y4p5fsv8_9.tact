struct BigNested {
    a: Int;
    b: Bool;
    c: Inner1;
}

struct Inner1 {
    d: Int;
    e: Inner2;
}

struct Inner2 {
    f: Bool;
    g: Inner3;
}

struct Inner3 {
    h: Int?;
    i: Bool?;
}

contract DeepTree {
    tree: BigNested;
    init() {
        self.tree = BigNested{
            a: 1,
            b: true,
            c: Inner1{
                d: 2,
                e: Inner2{
                    f: false,
                    g: Inner3{
                        h: null,
                        i: null,
                    },
                },
            },
        };
    }
}