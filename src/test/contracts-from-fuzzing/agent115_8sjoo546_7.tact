struct OptionalStruct {
    a: Int;
    b: Int?;
}

contract Test {
    data: OptionalStruct?;
    
    init() {
        self.data = OptionalStruct{
            a: 5,
            b: null,
        };
    }
}