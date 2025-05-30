struct S3 {
    x: Int as int32;
    y: Int? as uint8;
    z: Bool;
}

struct S2 {
    m: S3?;
    n: Int;
}

struct S1 {
    p: Int? as int64;
    q: S2;
}

contract DeepSerialize {
    val: S1;

    init() {
        self.val = S1{
            p: null,
            q: S2{
                m: null,
                n: -10
            }
        };
    }
}