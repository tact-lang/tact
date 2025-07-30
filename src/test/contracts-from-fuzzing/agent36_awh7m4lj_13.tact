struct S2 {
    optX: Int?;
    optY: Bool?;
}

struct S3 {
    nestedOpt: S2?;
    txt: String;
}

contract OptionalStructField {
    val: S3;

    init() {
        self.val = S3{
            nestedOpt: null,
            txt: "hello"
        };
    }
}
