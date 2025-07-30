struct OptionalInner { x: Int; y: Int }

struct OuterStruct {
    innerOpt: OptionalInner?;
    foo: Int;
}

contract OptionalFieldTest {
    data: OuterStruct;

    init() {
        self.data = OuterStruct{
            innerOpt: null,
            foo: 5
        };
    }
}