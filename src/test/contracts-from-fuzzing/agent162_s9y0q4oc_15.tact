struct Deep {
    s1: Inner1;
    s2: Inner2;
}

struct Inner1 {
    a: Int;
    b: String?;
    c: Bool;
}

struct Inner2 {
    d: Int?;
    e: Bool;
    f: String;
}

contract TestContract {
    data: Deep;

    init() {
        self.data = Deep{
            s1: Inner1{
                a: 5,
                b: null,
                c: true
            },
            s2: Inner2{
                d: null,
                e: false,
                f: "hello"
            }
        };
    }
}