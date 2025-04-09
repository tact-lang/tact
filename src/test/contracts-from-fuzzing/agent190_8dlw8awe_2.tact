struct DeeplyNested {
    x: Int;
    y: Inner1;
}

struct Inner1 {
    a: Int;
    b: Inner2;
}

struct Inner2 {
    u: Bool?;
    v: Inner3;
}

struct Inner3 {
    m: Int?;
    n: Bool;
}

contract TestNested {
    data: DeeplyNested;

    init() {
        self.data = DeeplyNested{
            x: 1,
            y: Inner1{
                a: 2,
                b: Inner2{
                    u: null,
                    v: Inner3{
                        m: null,
                        n: true
                    }
                }
            }
        };
    }
}