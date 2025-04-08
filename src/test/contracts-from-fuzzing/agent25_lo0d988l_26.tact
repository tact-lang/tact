// Optional nested struct with some fields null, some assigned
struct Inner {
    foo: Int?;
    bar: Bool?;
    baz: String?;
}

contract TestContract {
    nestedOpt: Inner;

    init() {
        self.nestedOpt = Inner{
            foo: null,
            bar: true,
            baz: null,
        };
    }
}