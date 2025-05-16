struct S1 {
    a: Int?;
    b: String;
}

struct S2 {
    x: Bool;
    y: S1;
}

struct S3 {
    s2: S2;
}

contract DeepStructs {
    store: S3;
    init() {
        self.store = S3{s2:S2{x:true,y:S1{a:null,b:"b"}}};
    }
}
