struct SingleOptional {
    optVal: Int?;
}

contract OptionalFieldTest {
    s: SingleOptional;
    
    init() {
        self.s = SingleOptional{ optVal: null };
    }
}