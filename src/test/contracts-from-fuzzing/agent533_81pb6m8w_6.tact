struct OuterOptional {
    inner: Inner?;
}

struct Inner {
    number: Int;
}

contract Test {
    data: OuterOptional;

    init() {
        self.data = OuterOptional{
            inner: null
        };
    }
}