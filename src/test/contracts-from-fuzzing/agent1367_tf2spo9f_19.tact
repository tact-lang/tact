struct S {
    a: Int;
    b: Bool;
    c: Int?;
}

contract InitOrder {
    s: S;

    init() {
        self.s = S{a:1,b:true,c:null};
    }
}