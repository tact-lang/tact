struct OptNested {
    inner: InnerStruct?;
}

struct InnerStruct {
    x: Int;
    y: Bool;
}

contract OptInsideTest {
    data: OptNested;

    init() {
        self.data = OptNested{
            inner: InnerStruct{ x: 5, y: false }
        };
    }
}