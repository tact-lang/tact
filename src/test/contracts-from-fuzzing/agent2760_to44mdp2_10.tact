struct Nested {
    s1: String;
    s2: Int?;
    s3: Bool;
}

contract DefaultVsInit {
    data: Nested = Nested{
        s1: "text",
        s2: null,
        s3: true
    };

    init() {
        self.data = Nested{
            s1: "changed",
            s2: 10,
            s3: false
        };
    }
}