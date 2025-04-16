struct ContainsOpt {
    a: Int?;
    b: String;
    c: Bool;
}

contract ComplexOpt {
    item: ContainsOpt;

    init() {
        self.item = ContainsOpt{a:null, b:"x", c:true};
    }
}