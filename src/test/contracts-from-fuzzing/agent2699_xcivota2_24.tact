struct A {
    f: Int?;
}

contract AssignUninitializedOptional {
    x: A;
    init() {
        self.x = A{ f: null };
        self.x.f = 99;
    }
}