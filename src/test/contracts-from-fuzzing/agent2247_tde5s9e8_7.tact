struct OptionalStruct {
    opt: SInner?;
}

struct SInner {
    x: Int;
    y: Int?;
}

contract OptTest {
    field: OptionalStruct;

    init() {
        self.field = OptionalStruct{
            opt: null
        };
    }
}
