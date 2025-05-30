struct S1 {
    x: Int;
}

struct S2 {
    nested: S1;
    y: Bool;
}

struct S3 {
    nested2: S2;
    z: String;
}

contract MultiLevel {
    data: S3;

    init() {
        self.data = S3{
            nested2: S2{nested: S1{x:1}, y:true},
            z: "zzz"
        };
    }
}