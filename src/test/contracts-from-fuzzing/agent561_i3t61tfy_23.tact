struct S {
    x: Bool;
    y: Bool?;
}

contract ManyNestedOptionals {
    s1: S;
    s2: S;
    s3: S;

    init() {
        self.s1 = S{x:true,y:null};
        self.s2 = S{x:false,y:null};
        self.s3 = S{x:true,y:null};
    }
}