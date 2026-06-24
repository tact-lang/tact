struct OptionalContainer {
    inner: InnerData?;
    name: String;
}

struct InnerData {
    a: Int;
    b: Bool;
}

contract OptInnerStruct {
    cont: OptionalContainer;

    init() {
        self.cont = OptionalContainer{
            inner: InnerData{ a: 42, b: true },
            name: "test"
        };
    }
}