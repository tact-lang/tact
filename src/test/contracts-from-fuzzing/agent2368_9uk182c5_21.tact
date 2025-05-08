struct S {
    x: Int;
    y: Int;
    z: Int;
}

contract ManyStructFields {
    s1: S;
    s2: S;
    s3: S;
    s4: S;
    s5: S;

    init() {
        self.s1 = S{ x:1, y:2, z:3 };
        self.s2 = S{ x:4, y:5, z:6 };
        self.s3 = S{ x:7, y:8, z:9 };
        self.s4 = S{ x:10, y:11, z:12 };
        self.s5 = S{ x:13, y:14, z:15 };
    }
}