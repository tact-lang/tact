struct OptionalStruct {
    opt1: Int?;
    opt2: Bool?;
    opt3: Cell?;
}

contract TestContract {
    data: OptionalStruct;
    
    init() {
        self.data = OptionalStruct{
            opt1: null,
            opt2: null,
            opt3: null,
        };
    }
}
