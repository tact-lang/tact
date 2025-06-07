struct HasStrings {
    fixed: String;
    optStr: String?;
}

contract ContractWithStrings {
    s: HasStrings;

    init() {
        self.s = HasStrings{fixed:"abc", optStr:null};
    }
}
