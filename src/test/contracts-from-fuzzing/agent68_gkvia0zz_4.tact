struct OptionalNested {
    val: Int?;
    inner: InnerStruct?;
}

struct InnerStruct {
    flag: Bool;
}

contract MultiOptTest {
    bigOpt: OptionalNested;

    init() {
        self.bigOpt = OptionalNested{
            val: null,
            inner: null
        };
    }
}