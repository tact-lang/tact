struct Sub {
    inner: Int?;
}

struct Outer {
    a: Int;
    sub: Sub?;
}

contract X {
    data: Outer;
    init() {
        self.data = Outer{
            a: 1,
            sub: null
        };
    }
}