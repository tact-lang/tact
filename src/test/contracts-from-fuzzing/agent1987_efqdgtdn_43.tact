struct SOpt {
    inner: Int?;
}

contract ManySOpt {
    opt1: SOpt?;
    opt2: SOpt?;
    opt3: SOpt?;
    
    init() {
        self.opt1 = SOpt{inner:null};
        self.opt2 = null;
        self.opt3 = SOpt{inner:42};
    }
}