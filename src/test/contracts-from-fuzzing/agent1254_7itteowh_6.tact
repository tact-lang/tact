struct InnerOpt {
    x: Int;
}

struct OuterOpt {
    y: InnerOpt?;
    z: String;
}

contract OptionalNestedStruct {
    data: OuterOpt;
    init() {
        self.data = OuterOpt{
            y: null,
            z: "nested",
        };
    }
}