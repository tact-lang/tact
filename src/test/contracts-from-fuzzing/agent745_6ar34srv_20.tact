struct One {
    a: Int;
    b: Bool;
}

struct Two {
    x: One;
    y: Int;
}

struct Three {
    left: Two;
    right: Two;
}

contract DoubleNested {
    payload: Three;
    init() {
        self.payload = Three{
            left: Two{
                x: One{ a:1, b:true },
                y: 2
            },
            right: Two{
                x: One{ a:3, b:false },
                y: 4
            }
        };
    }
}