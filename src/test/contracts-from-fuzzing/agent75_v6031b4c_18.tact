struct OptStruct {
    foo: Int?;
    bar: String?;
}

contract OptionalInner {
    s: OptStruct;
    
    init() {
        self.s = OptStruct{};
    }
}