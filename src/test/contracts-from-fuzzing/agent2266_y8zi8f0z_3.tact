struct Inner {
    s: String;
}

struct Wrapper {
    a: Int;
    b: Bool;
    c: Inner;
    d: Address;
    e: String?;
}

contract Test {
    w: Wrapper;

    init() {
        self.w = Wrapper{
            a: 7,
            b: false,
            c: Inner{s: "test"},
            d: myAddress(),
            e: null,
        };
    }
}
