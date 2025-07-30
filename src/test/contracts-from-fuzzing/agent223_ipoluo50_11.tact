struct StrStruct {
    s1: String;
    s2: String;
    s3: String;
}

contract StringStructTest {
    data: StrStruct;

    init() {
        self.data = StrStruct{
            s1: "one",
            s2: "two",
            s3: "three"
        };
    }
}