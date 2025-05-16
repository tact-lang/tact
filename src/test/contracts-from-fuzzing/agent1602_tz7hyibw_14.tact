struct InnerMostStruct {
    a: Int;
}

struct MiddleStruct {
    x: InnerMostStruct;
}

struct OuterStruct {
    y: MiddleStruct;
    z: InnerMostStruct?;
}

contract OptionalMiddle {
    data: OuterStruct?;

    init() {
        self.data = OuterStruct{
            y: MiddleStruct{
                x: InnerMostStruct{a: 10}
            },
            z: null,
        };
    }
}
