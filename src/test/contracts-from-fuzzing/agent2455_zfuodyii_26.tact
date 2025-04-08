struct AB {
    a: Int;
    b: Bool;
}

contract ManyStructFields {
    s1: AB;
    s2: AB;
    s3: AB;
    s4: AB;

    init() {
        self.s1 = AB{a:1,b:true};
        self.s2 = AB{a:2,b:false};
        self.s3 = AB{a:3,b:true};
        self.s4 = AB{a:4,b:false};
    }
}