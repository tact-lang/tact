struct S1 {
    a: Int;
}

struct S2 {
    b: S1; 
    c: Int;
}

struct S3 {
    d: S2;
    e: Bool;
}

contract ChainNested {
    val: S3;
    init() {
        self.val = S3{
            d: S2{b: S1{a:10}, c:20},
            e: true
        };
    }
}