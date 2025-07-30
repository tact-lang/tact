struct HasString {
    s1: String;
    s2: String?;
}

contract StringHolder {
    data: HasString;

    init() {
        self.data = HasString{
            s1: "Hello",
            s2: null,
        };
    }
}
