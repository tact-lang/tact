struct StringOptMix {
    s1: String;
    s2: String?;
    s3: String;
    s4: String?;
}

contract StringOptionalMix {
    val: StringOptMix;

    init() {
        self.val = StringOptMix{
            s1: "x",
            s2: null,
            s3: "y",
            s4: null
        };
    }
}