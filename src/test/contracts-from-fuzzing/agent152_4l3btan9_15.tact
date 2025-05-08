struct OptionalStringStruct {
    s: String?;
}

contract TestContract {
    val: OptionalStringStruct;
    
    init() {
        self.val = OptionalStringStruct{
            s: null
        };
    }
}
