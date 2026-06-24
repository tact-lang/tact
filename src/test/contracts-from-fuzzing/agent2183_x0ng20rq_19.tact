struct S {
    a: Int?;
    b: Bool = false;
}

contract Combo {
    f: S;

    init() {
        self.f = S{a:null,b:true};
    }
}