struct OptionalLayer {
    s: String?;
    n: Int?;
    a: Address?;
}

struct Wrapper {
    opt: OptionalLayer;
}

contract OptionalWrapTest {
    param: Wrapper;

    init() {
        self.param = Wrapper{
            opt: OptionalLayer{ s: null, n: null, a: null }
        };
    }
}