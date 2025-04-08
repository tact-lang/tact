struct InnerStruct {
    a: Int;
    b: String;
    c: Bool;
}

contract OptionalInnerStructField {
    innerOpt: InnerStruct?;
    
    init() {
        self.innerOpt = null;
    }
}