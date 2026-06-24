struct WithStringOpt {
    s1: String?;
    s2: String?;
    s3: String?;
}

contract StringOptFields {
    val: WithStringOpt;

    init() {
        self.val = WithStringOpt{
            s1:null,
            s2:null,
            s3:null
        };
    }
}