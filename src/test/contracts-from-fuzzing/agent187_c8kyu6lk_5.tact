struct StringStruct {
    s1: String;
    s2: String;
    s3: String;
}

contract StorageStringsTest {
    data: StringStruct;

    init() {
        self.data = StringStruct{
            s1: "foo",
            s2: "bar",
            s3: "baz",
        };
    }
}