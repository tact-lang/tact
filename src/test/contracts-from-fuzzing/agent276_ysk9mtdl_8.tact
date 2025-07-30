struct OptionalNest {
    x: Int;
    y: Bool;
}

struct OuterOpt {
    inner: OptionalNest?;
    name: String;
}

contract OptionalNestedStruct {
    info: OuterOpt;

    init() {
        self.info = OuterOpt{
            inner: OptionalNest{ x: 2, y: true },
            name: "hi"
        };
    }
}
