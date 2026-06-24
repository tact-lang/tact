struct SuccPartial {
    a: Int?;
    b: Bool;
    c: String?;
}

contract PartialDefaults {
    data: SuccPartial;

    init() {
        self.data = SuccPartial{a:null, b:true, c:null};
    }
}