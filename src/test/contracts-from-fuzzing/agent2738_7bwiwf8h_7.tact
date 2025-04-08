struct S1 {
    x: Int;
    y: Bool;
}

struct S2 {
    data: S1;
    comment: String;
}

struct S3 {
    inner: S2;
    flag: Bool?;
    note: String;
}

contract NestedMismatch {
    
    field1: S3;
    field2: Int;
    
    init() {
        self.field1 = S3{
            inner: S2{
                data: S1{x:42,y:true},
                comment: "hi"
            },
            flag: null,
            note: "ok"
        };
        self.field2 = 17;
    }
}
