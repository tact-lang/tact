struct OptString {
    s: String?;
}

contract NullStringOpt {
    v: OptString;
    init() {
        self.v = OptString{s:null};
    }
}
