struct S1 {
    a:Int; b:Bool; c:Int?; d:String;
}

struct S2 {
    s1:S1; x:Int;
}

struct S3 {
    s2:S2; y:Bool;
}

contract MultiNesting {
    data: S3;

    init() {
        self.data = S3{
            s2: S2{ s1: S1{ a:1, b:true, c:null, d:"hi" }, x:5 },
            y: false
        };
    }
}
