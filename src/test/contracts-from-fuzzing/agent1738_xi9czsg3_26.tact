struct S1 {
    x: Int;
    y: Bool;
}

contract MultipleStructs {
    s1: S1;
    s2: S1;
    s3: S1;

    init() {
        self.s1 = S1{x:1,y:true};
        self.s2 = S1{x:2,y:false};
        self.s3 = S1{x:3,y:true};
    }
}