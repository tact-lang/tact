struct S1 { a: Int; }
struct S2 { b: Bool; }
struct S3 { c: String; }
struct Outer {
    s1: S1;
    s2: S2;
    s3: S3;
    flag: Bool;
    text: String;
}

contract Test12 {
    outer: Outer;

    init() {
        self.outer = Outer{
            s1: S1{a:1},
            s2: S2{b:true},
            s3: S3{c:"ok"},
            flag: false,
            text: "hi",
        };
    }
}
