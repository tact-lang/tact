struct SubStruct {
    a: Int; 
    b: Bool?;
}

contract InitDefaults {
    field: SubStruct;

    init() {
        self.field = SubStruct{ a:5, b: null };
    }
}