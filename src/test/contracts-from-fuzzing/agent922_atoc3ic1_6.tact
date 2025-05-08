struct InnerMost {
    a: Bool?;
    b: Int;
}

struct Inner {
    x: InnerMost;
    y: Bool;
    z: Int?;
}

struct Outer {
    p: Int;
    q: Inner;
    r: Bool?;
}

contract TestContract {
    val: Outer;

    init() {
        self.val = Outer {
            p: 1,
            q: Inner {
                x: InnerMost {
                    a: null,
                    b: 7
                },
                y: false,
                z: 8
            },
            r: true
        };
    }
}