struct OuterOpt {
    maybe_inner: Inner?;
}

struct Inner {
    val: Int;
}

contract OptionOrderTest {
    f: OuterOpt;

    init() {
        self.f = OuterOpt{ maybe_inner: null };
    }
}