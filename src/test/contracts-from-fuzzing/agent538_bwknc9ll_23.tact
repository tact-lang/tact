struct SomeStruct {
    i: Int;
    s: String;
    b: Bool;
}

contract NullifyStruct {
    optStr: SomeStruct?;
    
    init() {
        self.optStr = SomeStruct{i:1,s:"s",b:true};
        self.optStr = null;
    }
}