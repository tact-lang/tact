struct S {
    a: Int = 1;
    b: Bool;
    c: String?;
}

contract SDefaultInit {
    f: S;

    init() {
        self.f = S{b:true, c:null};
    }
}