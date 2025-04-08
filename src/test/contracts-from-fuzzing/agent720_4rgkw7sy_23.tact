struct StringHolder {
    txt: String;
}

contract Strings {
    s1: String = "hello";
    s2: String?;
    s3: StringHolder;

    init() {
        self.s2 = null;
        self.s3 = StringHolder{ txt: "world" };
    }
}