struct DefaultOpt {
    a: Int = 1;
    b: Int?;
    c: String?;
}

contract UseDefaultOpt {
    d: DefaultOpt;
    init() {
        self.d = DefaultOpt{b:null,c:null};
    }
}