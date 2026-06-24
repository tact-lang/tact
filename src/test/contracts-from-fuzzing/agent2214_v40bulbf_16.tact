struct S1 { x: Int; }
struct S2 { y: Bool; }
struct S3 { z: String; }

struct Big {
    a: S1;
    b: S2;
    c: S3;
    i: Int;
    s: String;
    f: Bool;
}

contract Huge {
    val: Big;

    init() {
        self.val = Big{
            a: S1{x:10},
            b: S2{y:true},
            c: S3{z:"hello"},
            i: 20,
            s: "hi",
            f: false
        };
    }
}