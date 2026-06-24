struct OptionalPrim {
    a: Int?;
    b: Bool?;
    s: String?;
}

struct Wrapper {
    inner: OptionalPrim;
}

contract TestContract {
    w: Wrapper;

    init() {
        self.w = Wrapper{
            inner: OptionalPrim{
                a: null,
                b: true,
                s: null,
            }
        };
    }
}