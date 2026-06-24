struct OptionalLayer {
    val: Int?;
}

struct Wrapper {
    inner: OptionalLayer;
}

contract OptionalDeep {
    w: Wrapper;

    init() {
        self.w = Wrapper{
            inner: OptionalLayer{
                val: null,
            },
        };
    }
}