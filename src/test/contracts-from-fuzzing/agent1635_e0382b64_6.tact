struct Inner {
    a: Int;
}

struct Middle {
    inner: Inner;
}

struct Outer {
    middle: Middle?;
}

contract NestOptional {
    data: Outer;

    init() {
        self.data = Outer{middle: null};
    }
}
