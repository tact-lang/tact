// Test large nested structure with multiple String and Bool fields

struct S3 {
    x: String;
    y: Bool;
}

struct S2 {
    s3a: S3;
    s3b: S3;
}

struct S1 {
    s2: S2;
    flag: Bool;
}

contract TestContract {
    val: S1;

    init() {
        self.val = S1{
            s2: S2{
                s3a: S3{x: "foo", y:true},
                s3b: S3{x: "bar", y:false}
            },
            flag: true
        };
    }
}