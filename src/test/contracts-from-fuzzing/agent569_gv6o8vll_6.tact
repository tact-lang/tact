struct OptOpt {
    a: Int?;
    b: String?;
    c: Bool?;
}

contract MixedOptionals {
    val: OptOpt;
    init() {
        self.val = OptOpt{a:null, b:null, c:true};
    }
}