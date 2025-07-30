struct StringsStruct {
    s1: String;
    s2: String;
    s3: String;
}

contract TestContract {
    strdata: StringsStruct = StringsStruct{
        s1: "alpha",
        s2: "beta",
        s3: "gamma"
    };

    receive() {
        let _ = self.strdata;
    }
}