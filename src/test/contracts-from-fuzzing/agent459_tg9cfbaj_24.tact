struct S1 {
    x: Int;
}

struct S2 {
    s1: S1;
    y: Bool;
}

struct S3 {
    s2: S2;
    z: String;
}

contract DeepNestStorage {
    val: S3 = S3{
        s2: S2{
            s1: S1{ x: 5 },
            y: true
        },
        z: "hello"
    };

    init() {
        self.val = S3{
            s2: S2{
                s1: S1{ x: 10 },
                y: false
            },
            z: "world"
        };
    }
}