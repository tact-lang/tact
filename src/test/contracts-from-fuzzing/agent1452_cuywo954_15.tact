struct StringHolder {
    s1: String;
    s2: String?;
    s3: String;
}

contract MultiStringStorage {
    data: StringHolder;

    init() {
        self.data = StringHolder{
            s1: "hello",
            s2: null,
            s3: "world"
        };
    }
}
