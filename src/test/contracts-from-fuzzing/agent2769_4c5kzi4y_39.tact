struct A1 {
    n: Int;
    s: String;
}

struct A2 {
    f: Bool;
    inner: A1;
}

contract DoubleNest {
    x: A2;

    init() {
        self.x = A2{
            f:true,
            inner: A1{n: 7, s: "abc"},
        };
    }
}