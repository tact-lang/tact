struct S {
    id: Int;
    label: String;
}

contract ArraySim {
    s1: S;
    s2: S;
    s3: S;
    init() {
        self.s1 = S{ id:1, label:"one" };
        self.s2 = S{ id:2, label:"two" };
        self.s3 = S{ id:3, label:"three" };
    }
}