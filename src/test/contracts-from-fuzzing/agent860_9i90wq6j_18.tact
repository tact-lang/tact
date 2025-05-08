struct NestedOptionals {
    x: Int?;
    y: String?;
    z: Bool?;
}

struct Wrapper {
    inner: NestedOptionals?;
}

contract OptionalWrap {
    w: Wrapper;

    init() {
        self.w = Wrapper{
            inner: null
        };
    }
}