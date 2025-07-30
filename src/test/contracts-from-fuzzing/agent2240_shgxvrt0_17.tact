struct DeepOptionalStruct {
    inner1: Int?;
    inner2: Bool?;
    inner3: String?;
    inner4: Cell?;
    inner5: Slice?;
}

contract DeepOpt {
    s: DeepOptionalStruct;

    init() {
        self.s = DeepOptionalStruct{
            inner1: null,
            inner2: null,
            inner3: null,
            inner4: null,
            inner5: null
        };
    }
}