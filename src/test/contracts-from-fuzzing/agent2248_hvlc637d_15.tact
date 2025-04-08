struct S1 {
    a: Int?;
    b: Bool;
}

struct S2 {
    x: S1;
    y: String;
}

struct S3 {
    inner: S2?;
    label: String?;
}

contract OptionalLayers {
    data: S3;

    init() {
        self.data = S3{
            inner: S2{
                x: S1{a:null, b:false},
                y: "foo"
            },
            label: null
        };
    }
}