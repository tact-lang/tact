struct DeepOuter {
    inner: InnerStruct;
}

struct InnerStruct {
    sub: SubInner;
}

struct SubInner {
    value1: Int;
    value2: Bool;
    opt: Int?;
    txt: String;
}

contract VeryDeep {
    state: DeepOuter;

    init() {
        self.state = DeepOuter{
            inner: InnerStruct{
                sub: SubInner{
                    value1: 10,
                    value2: true,
                    opt: null,
                    txt: "deep"
                }
            }
        };
    }
}