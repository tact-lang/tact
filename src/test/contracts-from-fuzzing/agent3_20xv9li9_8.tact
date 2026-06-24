struct InnerWidth {
    a: Int as int8;
    b: Int as uint16;
}

struct OuterWidth {
    inner: InnerWidth;
    big: Int as int257;
}

contract SerializedNested {
    data: OuterWidth;

    init() {
        self.data = OuterWidth{
            inner: InnerWidth{
                a: -10,
                b: 65535
            },
            big: 123456789
        };
    }
}