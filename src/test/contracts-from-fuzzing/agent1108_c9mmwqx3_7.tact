struct Inner {
    foo: Int?;
}

struct Middle {
    bar: Inner?;
}

contract TestContract {
    data: Middle?;

    init() {
        self.data = Middle{
            bar: Inner{ foo: 123 }
        };
    }
}