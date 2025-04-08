struct NestedOpt {
    val: Int?;
}

contract DeepNestedOptional {
    optField: NestedOpt?;
    
    init() {
        self.optField = null;
    }
}