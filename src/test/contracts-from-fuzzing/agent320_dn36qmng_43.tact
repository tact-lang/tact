struct S {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
}

contract Test {
    s: S;

    init() {
        self.s = S{a:1,b:true,c:"c",d:null};
    }
}