struct S3 {
    a: Int;
    b: Bool?;
}

struct S4 {
    x: S3;
    y: S3?;
}

contract OptionalStructs {
    val: S4;

    init() {
        self.val = S4{
            x: S3{ a:1, b: null },
            y: null,
        };
    }
}