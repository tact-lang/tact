struct S {
    i: Int;
    b: Bool;
    s: String;
    o: Int?;
    f: Bool?;
}

contract Combo {
    store: S;
    init() {
        self.store = S{i:1,b:true,s:"s",o:null,f:null};
    }
}
