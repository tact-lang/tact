struct S {
    x: Int;
    y: Bool;
}

contract ListOfStructs {
    s1: S;
    s2: S;
    s3: S;
    s4: S;
    s5: S;

    init() {
        self.s1=S{x:1,y:true}; self.s2=S{x:2,y:false};
        self.s3=S{x:3,y:true}; self.s4=S{x:4,y:false}; self.s5=S{x:5,y:true};
    }
}