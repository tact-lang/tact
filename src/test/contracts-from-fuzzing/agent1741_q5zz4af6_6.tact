struct OptionalNested {
    inner1: Int?;
    inner2: String?;
    inner3: Bool?;
}

contract TestOptionalsInStruct {
    st: OptionalNested;
    init() {
        self.st = OptionalNested{
            inner1: null,
            inner2: null,
            inner3: null
        };
    }
}