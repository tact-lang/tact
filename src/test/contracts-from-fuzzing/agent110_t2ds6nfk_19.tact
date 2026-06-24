struct HasOptionals {
    a: Int?;
    b: Bool?;
    c: Address?;
}

contract Opts {
    ho: HasOptionals;
    init() {
        self.ho = HasOptionals{a:null,b:null,c:null};
    }
}