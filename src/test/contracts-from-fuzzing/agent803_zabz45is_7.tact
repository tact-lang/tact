struct StringHolder {
    s1: String;
    s2: String;
    s3: String;
}

contract MultiStringStruct {
    ss: StringHolder;

    init() {
        self.ss = StringHolder{
            s1: "a", s2: "b", s3: "c"
        };
    }
}