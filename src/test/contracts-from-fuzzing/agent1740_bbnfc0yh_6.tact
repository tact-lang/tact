struct OptionalNest {
    a: Int?;
    b: Bool?;
    c: Address?;
}

contract Test {
    opt: OptionalNest = OptionalNest{a:null, b:true, c:null};

    init() {
        self.opt = OptionalNest{a:1, b:null, c:myAddress()};
    }
}