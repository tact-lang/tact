struct OptionalSerializeNest {
    inner: OptionalSerializeInner;
}

struct OptionalSerializeInner {
    a: Int? as uint32;
}

contract OptionalSerializeNestTest {
    x: OptionalSerializeNest;

    init() {
        self.x = OptionalSerializeNest{
            inner: OptionalSerializeInner{
                a: null
            }
        };
    }
}