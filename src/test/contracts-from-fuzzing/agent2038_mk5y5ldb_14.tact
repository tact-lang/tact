struct OptionOnly {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract C {
    oo: OptionOnly;

    init() {
        self.oo = OptionOnly{a:null,b:null,c:null};
    }
}