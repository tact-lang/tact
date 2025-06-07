struct StructEmptyOptional {
    a: Int?;
}

contract TestEmptyOptional {
    x: StructEmptyOptional;
    
    init() {
        self.x = StructEmptyOptional{a:null};
    }
}