struct S {
    some: Int?;
}

contract OptInit {
    f: S;

    init() {
        self.f = S{some:null};
    }
}