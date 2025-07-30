struct OptS {
    a: Int?;
}

contract NullInit {
    s: OptS;
    init() {
        self.s = OptS{a:null};
    }
}