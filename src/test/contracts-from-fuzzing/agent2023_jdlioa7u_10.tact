struct Inner {
    a: Int;
    b: String;
    c: Bool?;
}

struct Wrapper {
    i: Inner;
    s: String?;
    n: Int?;
}

struct Outer {
    w1: Wrapper;
    w2: Wrapper;
}

contract TestContract {
    nestedStruct: Outer;

    init() {
        self.nestedStruct = Outer{
            w1: Wrapper{
                i: Inner{
                    a: 1,
                    b: "x",
                    c: true,
                },
                s: null,
                n: 2,
            },
            w2: Wrapper{
                i: Inner{
                    a: 3,
                    b: "y",
                    c: false,
                },
                s: "str",
                n: null,
            },
        };
    }

    receive() {
        let b = self.nestedStruct.w2.i.b;
    }
}