struct StrStruct {
    s1: String;
    s2: String?;
    s3: String;
    s4: String?;
}

contract StringStructStorage {
    data: StrStruct;

    init() {
        self.data = StrStruct{
            s1: "alpha",
            s2: null,
            s3: "beta",
            s4: "gamma"
        };
    }
}