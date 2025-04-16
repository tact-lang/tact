struct DeepNest {
    inner: InnerStruct;
}

struct InnerStruct {
    flag: Bool;
    text: String;
}

contract Test {
    state: DeepNest;

    init() {
        self.state = DeepNest{
            inner: InnerStruct{
                flag: false,
                text: "world"
            }
        };
    }
}