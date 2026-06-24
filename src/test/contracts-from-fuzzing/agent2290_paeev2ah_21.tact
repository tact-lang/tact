struct BigNested {
    s1: Inner1;
    s2: Inner2;
}

struct Inner1 {
    f1: Int;
    f2: Inner2;
}

struct Inner2 {
    x: Int;
    y: Bool;
    z: Inner3;
}

struct Inner3 {
    a: String;
    b: Int?;
}

contract Test21 {
    val: BigNested;

    init() {
        self.val = BigNested{
            s1: Inner1{
                f1: 11,
                f2: Inner2{
                    x: 22,
                    y: true,
                    z: Inner3{
                        a: "hello",
                        b: null
                    }
                }
            },
            s2: Inner2{
                x: 33,
                y: false,
                z: Inner3{
                    a: "world",
                    b: 44
                }
            }
        };
    }
}