struct OptionalStringStruct {
    s1: String?;
    s2: String?;
    s3: String?;
}

contract OptStringTest {
    data: OptionalStringStruct;
    init() {
        self.data = OptionalStringStruct{
            s1: null,
            s2: "hello",
            s3: null
        };
    }
}
