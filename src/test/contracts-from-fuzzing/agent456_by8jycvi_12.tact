struct OptionalIntStruct {
    x: Int?;
}

contract OptionalUninit {
    s: OptionalIntStruct;

    init() {
        self.s = OptionalIntStruct { x: null };
    }
    
    receive() {
        self.s = OptionalIntStruct { x: null };
    }
}