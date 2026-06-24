struct InnerOptional {
    x: Int?;
    y: Bool?;
}

struct MidStruct {
    inner1: InnerOptional;
    inner2: InnerOptional;
}

contract DeepOptionals {
    state: MidStruct;

    init() {
        self.state = MidStruct{
            inner1: InnerOptional{ x: null, y: true },
            inner2: InnerOptional{ x: 42, y: null }
        };
    }
}