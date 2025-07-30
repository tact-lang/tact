struct S1 {
    a: Int;
    b: Bool;
}

struct S2 {
    x: String;
    y: S1;
}

struct S3 {
    s: S2;
    optional_string: String?;
    another_s: S2?;
}

contract WiderNested {
    data: S3;

    init() {
        self.data = S3{
            s: S2{
                x: "abc",
                y: S1{ a: 42, b: false }
            },
            optional_string: null,
            another_s: null
        };
    }
}