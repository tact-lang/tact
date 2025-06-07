struct NestedStringOpt {
    inner: InnerOptStr;
}

struct InnerOptStr {
    s1: String?;
    s2: String?;
    s3: String?;
}

contract TestNestedStringOpt {
    d: NestedStringOpt;

    init() {
        self.d = NestedStringOpt{
            inner: InnerOptStr{
                s1:null, s2:null, s3:null
            }
        };
    }
}