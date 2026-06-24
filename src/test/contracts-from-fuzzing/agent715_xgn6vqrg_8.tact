struct StringHeavy {
    s1: String;
    s2: String;
    s3: String;
    s4: String;
    s5: String;
}

contract TestContract {
    texts: StringHeavy;

    init() {
        self.texts = StringHeavy{
            s1:"alpha", s2:"beta", s3:"gamma", s4:"delta", s5:"epsilon"
        };
    }
}