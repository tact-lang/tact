contract OptionalInStruct {
    structed: WithOpt;

    init() {
        self.structed = WithOpt{ x: 10, y: null };
    }
}

struct WithOpt {
    x: Int;
    y: String?;
}