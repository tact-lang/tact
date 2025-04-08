struct S {
    a:Int;
    b:Bool;
}
contract Arranged {
    s1: S;
    s2: S;
    
    init() {
        self.s1 = S{a:1,b:true};
        self.s2 = S{a:2,b:false};
    }
}