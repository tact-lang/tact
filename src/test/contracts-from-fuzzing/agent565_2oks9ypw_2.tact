struct DeepNested {
    z: Int?;
}

struct MiddleNested {
    d: DeepNested;
}

struct TopStruct {
    m: MiddleNested;
}

contract TestContract {
    top: TopStruct;

    init() {
        self.top = TopStruct{
            m: MiddleNested{
                d: DeepNested{ z: null }
            }
        };
    }
}