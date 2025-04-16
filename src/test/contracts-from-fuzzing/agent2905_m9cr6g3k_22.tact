struct S {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract NestedManyOptionals {
    s1: S;
    s2: S;
    s3: S;
    s4: S;

    init() {
        self.s1 = S{ x:null, y:null, z:null };
        self.s2 = S{ x:null, y:null, z:null };
        self.s3 = S{ x:null, y:null, z:null };
        self.s4 = S{ x:null, y:null, z:null };
    }
}