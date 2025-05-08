struct OptionalInner {
    optVal1: Int?;
    optVal2: Bool?;
    optVal3: String?;
}

contract OptionalNestedStructTest {
    data: OptionalInner;
    
    init() {
        self.data = OptionalInner{
            optVal1: null,
            optVal2: null,
            optVal3: null
        };
    }
}