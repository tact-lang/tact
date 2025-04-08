message(111) DeepMsg {
    info: String?;
}

struct MidStruct {
    m: DeepMsg?;
}

struct TopStruct {
    nested: MidStruct?;
}

contract MultiOptPersist {
    s: TopStruct;

    init() {
        self.s = TopStruct{
            nested: MidStruct{
                m: null
            }
        };
    }
}