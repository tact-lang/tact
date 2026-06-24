struct OptionalStringStruct {
    s1: String?;
    s2: String?;
    s3: String?;
}

contract TestContract {
    data: OptionalStringStruct;

    init() {
        self.data = OptionalStringStruct{
            s1: null,
            s2: "hi",
            s3: null
        };
    }
}