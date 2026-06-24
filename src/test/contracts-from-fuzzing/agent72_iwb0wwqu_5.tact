struct OptionalStruct {
    x: Int;
}

contract OptionalFieldTest {
    opt: OptionalStruct?;
    
    init() {
        self.opt = OptionalStruct{ x: 99 };
    }
}