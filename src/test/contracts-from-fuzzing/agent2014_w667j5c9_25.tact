struct SOpt {
    f1: Int? = null;
    f2: Bool? = null;
    f3: Address? = null;
    f4: Cell? = null;
    f5: String? = null;
}

contract StructOptDefault {
    s: SOpt;

    init() {
        self.s = SOpt{
            f1:null,f2:null,f3:null,f4:null,f5:null
        };
    }
}