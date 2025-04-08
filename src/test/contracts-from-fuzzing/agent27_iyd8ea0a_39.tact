struct SOpt {
    f1: Int?;
    f2: Bool?;
    f3: String?;
}

contract NestedSOpt2 {
    sfield: SOpt?;

    init() {
        self.sfield = SOpt{
            f1:null,f2:null,f3:null
        };
    }
}