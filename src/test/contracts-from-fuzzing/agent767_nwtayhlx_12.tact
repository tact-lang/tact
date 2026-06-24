struct S3 {
    x: Int;
    y: Bool;
    s: String;
}

struct S2 {
    inner: S3;
    flag: Bool;
    count: Int as uint8;
}

struct S1 {
    nested: S2;
    msg: String;
}

contract DeepWide {
    payload: S1;

    init() {
        self.payload = S1{
            nested: S2{
                inner: S3{
                    x: 9,
                    y: true,
                    s: "str"
                },
                flag: false,
                count: 7
            },
            msg: "hello"
        };
    }
}
