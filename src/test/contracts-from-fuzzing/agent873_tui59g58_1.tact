struct NestedOptional {
    val: Int?; 
    str: String?;
}

contract DeepNestedOptional {
    nested: NestedOptional;
    flag: Bool = false;
    
    init() {
        self.nested = NestedOptional{
            val: null,
            str: null
        };
        self.flag = true;
    }
}