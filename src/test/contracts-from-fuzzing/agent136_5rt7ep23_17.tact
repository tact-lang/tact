struct WrappedBool {
    val: Bool;
}

struct OuterWithDefault {
    inner: WrappedBool = WrappedBool{ val: false };
}

contract WrapDefault {
    f: OuterWithDefault;

    init() {
        self.f = OuterWithDefault{};
    }
}