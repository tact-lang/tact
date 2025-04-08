struct OptStruct {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract ManyOptionals {
    s1: OptStruct?;
    s2: OptStruct?;
    s3: OptStruct?;
    
    init() {
        self.s1 = null;
        self.s2 = null;
        self.s3 = null;
    }
}