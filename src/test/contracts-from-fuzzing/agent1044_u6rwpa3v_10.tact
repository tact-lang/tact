struct OptInNested {
    val: Int?;
}

struct ContainsOptNested {
    optNested: OptInNested;
}

contract OptDeep {
    dat: ContainsOptNested;
    init() {
        self.dat = ContainsOptNested {
            optNested: OptInNested { val: null }
        };
    }
}