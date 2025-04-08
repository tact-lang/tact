struct OptionalStruct {
    a: Int;
    b: Bool;
}

contract TestContract {
    opt: OptionalStruct?;
    
    init() {
        self.opt = null;
    }
}