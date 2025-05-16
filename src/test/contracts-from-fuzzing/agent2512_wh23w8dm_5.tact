struct InnerMost {
    x: Int;
    y: String?;
}

struct MidLevel {
    arr: InnerMost;
    optionalStruct: InnerMost?;
}

struct Container {
    content: MidLevel;
    optionalMid: MidLevel?;
}

contract NestedOptionals {
    payload: Container;

    init() {
        self.payload = Container{
            content: MidLevel{
                arr: InnerMost{ x:3, y:"abc" },
                optionalStruct: null
            },
            optionalMid: null
        };
    }
}