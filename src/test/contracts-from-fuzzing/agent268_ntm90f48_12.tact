struct StrOptMix {
    s1: String;
    s2: String?;
    s3: String;
    s4: String?;
}

contract MixStringOptional {
    data: StrOptMix;

    init() {
        self.data = StrOptMix{
            s1: "alpha", s2: null, s3: "beta", s4: null
        };
    }
}