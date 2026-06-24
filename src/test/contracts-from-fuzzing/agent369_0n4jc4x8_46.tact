struct OptionalBoolInt {
    b: Bool?;
    i: Int?;
}

struct AnotherNestedOpt {
    inner: OptionalBoolInt?;
}

contract AnotherNestedOptTest {
    s: AnotherNestedOpt;

    init() {
        self.s = AnotherNestedOpt{
            inner: OptionalBoolInt{b:null,i:null},
        };
    }
}