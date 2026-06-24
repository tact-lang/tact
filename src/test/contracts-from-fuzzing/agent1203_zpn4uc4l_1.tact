struct NestedOptional {
    flag: Bool?; 
    number: Int?;
}

contract DeepNested {
    nested: NestedOptional;
    flag: Bool;
    number: Int;
    
    init() {
        self.nested = NestedOptional{flag: null, number: null};
        self.flag = false;
        self.number = 0;
    }
}