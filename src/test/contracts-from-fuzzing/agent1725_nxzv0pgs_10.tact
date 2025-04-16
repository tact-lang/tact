struct OptionalStringStruct {
    s: String?;
    s2: String?;
    s3: String?;
}

contract TestContract {
    data: OptionalStringStruct;

    init() {
        self.data = OptionalStringStruct{
            s: null,
            s2: null,
            s3: "abc",
        };
    }
}