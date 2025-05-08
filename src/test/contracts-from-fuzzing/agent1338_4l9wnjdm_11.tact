struct One {
    a: Int;
}

struct Two {
    one: One;
    b: Int;
}

struct Three {
    two: Two;
    c: Int;
}

struct Four {
    three: Three;
    d: Int;
}

struct Five {
    four: Four;
    e: Int;
}

contract DeepStack {
    deep: Five;

    init() {
        self.deep = Five{
            four: Four{
                three: Three{
                    two: Two{
                        one: One{ a:1 },
                        b:2
                    },
                    c:3
                },
                d:4
            },
            e:5
        };
    }
}