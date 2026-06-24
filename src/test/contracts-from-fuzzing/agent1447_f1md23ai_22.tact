struct ContainsBool {
    flag: Bool;
    value: Int;
}

contract BoolFirst {
    s: ContainsBool;
    
    init() {
        self.s = ContainsBool{ flag:true, value:123 };
    }
}