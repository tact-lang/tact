struct IntBoolStr {
    a: Int;
    b: Bool;
    c: String;
}

contract PartialDefaults {
    data: IntBoolStr;
    
    init() {
        self.data = IntBoolStr{
            a:1,
            b:true,
            c:""
        };
    }
}
