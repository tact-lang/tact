struct S4 {
    x: Int;
}

struct S3 {
    s4: S4?;
}

struct S2 {
    s3: S3;
    flag: Bool;
}

struct S1 {
    s2: S2?;
    note: String;
}

contract DeepOptLayers {
    data: S1;

    init() {
        self.data = S1{
            s2: null,
            note: "deepopt"
        };
    }
}