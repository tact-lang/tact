struct NestedInOptional {
    someValue: Int;
}

contract OptWithNestedOptional {
    var1: NestedInOptional?;
    
    init() {
        self.var1 = NestedInOptional{
            someValue: 42
        };
    }
}