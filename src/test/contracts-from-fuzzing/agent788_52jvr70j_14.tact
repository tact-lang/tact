struct S {
    i: Int;
    b: Bool;
    t: String;
}

contract StructArray {
    s1: S;
    s2: S;
    s3: S;

    init() {
        self.s1 = S{i:1,b:true,t:"a"};
        self.s2 = S{i:2,b:false,t:"b"};
        self.s3 = S{i:3,b:true,t:"c"};
    }
}