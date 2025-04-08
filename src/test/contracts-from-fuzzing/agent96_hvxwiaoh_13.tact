struct StringHolder {
    s1: String;
    s2: String;
    s3: String?;
    s4: String?;
}

contract StringyPersistent {
    data: StringHolder;

    init() {
        self.data = StringHolder{
            s1: "short",
            s2: "a much longer string just for testing persistence",
            s3: "optional but set",
            s4: null,
        };
    }

    receive() {}
}