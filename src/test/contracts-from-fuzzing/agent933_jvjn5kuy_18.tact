struct OptionalNest {
    a: Int?;
    b: String?;
}

struct OuterOpt {
    nest: OptionalNest?;
}

contract OptLayer {
    s: OuterOpt;
    init() {
        self.s = OuterOpt{nest:null};
    }
}
