struct OptionalStruct {
    value: Int?;
    text: String?;
}

contract TestContract {
    opt: OptionalStruct;
    
    init() {
        self.opt = OptionalStruct{
            value: null,
            text: null,
        };
    }
}