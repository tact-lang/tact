struct OuterOpt {
    a: Int?;
}

contract ContractOptStructOptField {
    outer: OuterOpt?;

    init() {
        self.outer=null;
    }
}