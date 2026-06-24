struct S {
    x: Int; y: Bool; s: String; o: Int?;
}

contract StructArray {
    s1: S;
    s2: S;
    s3: S;

    init() {
        self.s1 = S{x:1, y:true, s:"one", o:null};
        self.s2 = S{x:2, y:false, s:"two", o:2};
        self.s3 = S{x:3, y:true, s:"three", o:null};
    }
}
