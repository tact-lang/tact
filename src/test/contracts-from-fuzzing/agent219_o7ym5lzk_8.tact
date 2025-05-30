struct InnerX {
    x: Int;
    y: Bool;
}

struct InnerY {
    z: String;
}

struct OuterAllOpt {
    innerX: InnerX?;
    innerY: InnerY?;
    strVal: String?;
    boolVal: Bool?;
    numVal: Int?;
}

contract AllOptionalNested {
    data: OuterAllOpt?;

    init() {
        self.data = OuterAllOpt{
            innerX: InnerX{ x: 3, y: true },
            innerY: null,
            strVal: null,
            boolVal: null,
            numVal: null
        };
    }
}