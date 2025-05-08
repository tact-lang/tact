struct NestedOptionals {
    oi: Int?;
    os: String?;
}

struct OuterStruct {
    inner: NestedOptionals?;
    b: Bool;
}

contract NestedOptTest {
    s: OuterStruct;

    init() {
        self.s = OuterStruct{
            inner: null,
            b: true
        };
    }
}