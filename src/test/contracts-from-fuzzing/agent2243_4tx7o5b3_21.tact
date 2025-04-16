struct One {
    a: Int;
    b: Bool;
}

struct Two {
    first: One;
    second: Bool;
}

struct Three {
    top: Two;
    mid: Int;
}

contract NestedTrio {
    data: Three;

    init() {
        self.data = Three{
            top: Two{
                first: One{a:1,b:false},
                second: true
            },
            mid: 42
        };
    }
}
