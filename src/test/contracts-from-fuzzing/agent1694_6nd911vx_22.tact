struct S1 { a: Int as int32; b: Bool?; }
struct S2 { c: String; d: Address; }
struct S3 { e: Int as coins; f: Bool?; }
struct Combined {
    s1: S1;
    s2: S2;
    s3: S3;
    s2opt: S2?;
}

contract MixedNested {
    data: Combined;

    init() {
        self.data = Combined{
            s1: S1{a: -12345, b: null},
            s2: S2{c: "abc", d: myAddress()},
            s3: S3{e: ton("3"), f: true},
            s2opt: null
        };
    }
}