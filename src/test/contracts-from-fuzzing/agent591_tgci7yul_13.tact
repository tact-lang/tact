struct EmptyStringStruct {
    empty: String;
}

contract EmptyStringTest {
    field: EmptyStringStruct;
    
    init() {
        self.field = EmptyStringStruct{ empty: "" };
    }
}