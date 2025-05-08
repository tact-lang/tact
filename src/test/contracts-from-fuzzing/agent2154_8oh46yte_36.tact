struct WithStrings {
    s1:String; s2:String; s3:String;
}

contract StringsDefaults {
    ss: WithStrings;

    init() {
        self.ss = WithStrings{s1:"", s2:"hello", s3:"world"};
    }
}