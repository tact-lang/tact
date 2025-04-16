struct S {
    x: Int;
    y: String?;
}

contract ReassignAfterNull {
    f: S;
    init() {
        self.f = S{x:1,y:null};
        self.f = S{x:2,y:"hey"};
    }
}