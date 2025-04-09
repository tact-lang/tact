struct InnerData {
    x: Int;
    y: String;
    z: Bool?;
}

struct OuterData {
    d: Int;
    optInner: InnerData?;
}

contract OptionalNestedStruct {
    state: OuterData;

    init() {
        self.state = OuterData{
            d: 5,
            optInner: null,
        };
    }
}