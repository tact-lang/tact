struct OnlyIntStruct {
    val: Int;
}

contract SingleIntField {
    field: Int;
    
    init() {
        self.field = 1;
    }
    
    receive() {
        self.field = 2;
    }
}