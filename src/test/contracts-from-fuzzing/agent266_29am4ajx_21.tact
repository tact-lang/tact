struct EmptyOptStruct {
    foo: Int?;
}

contract DefaultIsNull {
    eo: EmptyOptStruct;
    
    init() {
        self.eo = EmptyOptStruct{ foo: null };
    }
}