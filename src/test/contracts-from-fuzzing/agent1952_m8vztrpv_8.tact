struct BigNested {
    a: Int;
    b: Inner1;
    c: Inner2;
}

struct Inner1 {
    x: Int;
    y: Bool;
}

struct Inner2 {
    m: Bool?;
    n: Deepest;
}

struct Deepest {
    val: Int;
    flag: Bool?;
}

contract TestContract {
    data: BigNested;

    init() {
        self.data = BigNested{
            a: 1,
            b: Inner1{
                x: 2,
                y: true,
            },
            c: Inner2{
                m: false,
                n: Deepest{
                    val: 42,
                    flag: null,
                },
            },
        };
    }
}
