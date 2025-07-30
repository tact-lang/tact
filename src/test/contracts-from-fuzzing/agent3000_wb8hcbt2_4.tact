struct OptionalStruct {
    s1: String;
    s2: Bool?;
    s3: Int?;
}

contract Test4 {
    os: OptionalStruct;

    init() {
        self.os = OptionalStruct{
            s1: "hello",
            s2: null,
            s3: 99,
        };
    }
}
