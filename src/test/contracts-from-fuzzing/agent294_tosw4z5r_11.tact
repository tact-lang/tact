struct Inner {
    i: Int?;
    m: Msg?;
}

message(4) Msg {
    foo: Int?;
}

struct Outer {
    inner: Inner?;
    b: Bool?;
}

contract MaxVariety {
    field: Outer;

    init() {
        self.field = Outer{
            inner: null,
            b: true
        };
    }
}
