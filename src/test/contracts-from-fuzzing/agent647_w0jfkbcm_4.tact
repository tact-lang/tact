struct BigNest {
    a: Int;
    b: Nested1;
    c: Nested2;
}

struct Nested1 {
    x: Int?;
    y: Inner;
}

struct Nested2 {
    p: Bool;
    q: Inner;
}

struct Inner {
    v: String;
    w: Address;
}

contract TestContract {
    data: BigNest;

    init() {
        self.data = BigNest{
            a: 1,
            b: Nested1{
                x: null,
                y: Inner{
                    v: "hello",
                    w: myAddress()
                }
            },
            c: Nested2{
                p: true,
                q: Inner{
                    v: "world",
                    w: myAddress()
                }
            }
        };
    }
}