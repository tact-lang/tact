struct OptionalStruct {
    inner: Int?;
    text: String;
}

contract PersistDefaultNull {
    s: OptionalStruct;

    init() {
        self.s = OptionalStruct{
            inner: null,
            text: ""  
        };
    }
}