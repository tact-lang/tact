struct OptionalStruct {
    a: Int;
    b: Bool;
}

contract TestContract {
    os: OptionalStruct?;
    
    init() {
        self.os = null;
    }
}