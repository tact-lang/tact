struct InnerStruct {
    v1: Int;
    v2: Bool;
    v3: String;
}

contract ManyOptionals {
    s1: InnerStruct?;
    s2: InnerStruct?;
    s3: InnerStruct?;
    
    init() {
        self.s1 = null;
        self.s2 = null;
        self.s3 = null;
    }
}