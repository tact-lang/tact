struct Inner1 {
    v1: Int;
    v2: String;
}

struct Inner2 {
    p: Bool;
    q: Int;
}

struct Outer {
    in1: Inner1;
    in2: Inner2;
    z: String;
}

contract MultiInner {
    data: Outer;
    init() {
        self.data = Outer{
            in1: Inner1{
                v1: 5,
                v2: "x"
            },
            in2: Inner2{
                p: true,
                q: -8
            },
            z: "end"
        };
    }
}