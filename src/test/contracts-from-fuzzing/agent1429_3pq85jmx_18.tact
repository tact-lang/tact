struct MultiNested {
    a: Int;
    b: Bool;
    c: String;
    d: Inner1;
}

struct Inner1 {
    x: Int;
    y: Inner2;
}

struct Inner2 {
    z: Bool;
    w: Inner3;
}

struct Inner3 {
    q: String;
    r: Int?;
}

contract CrazyNesting {
    nested: MultiNested;

    init() {
        self.nested = MultiNested{
            a: 1,
            b: true,
            c: "test",
            d: Inner1{
                x: 2,
                y: Inner2{
                    z: false,
                    w: Inner3{
                        q: "deep",
                        r: null
                    }
                }
            }
        };
    }
}