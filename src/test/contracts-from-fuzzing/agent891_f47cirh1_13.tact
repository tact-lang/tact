struct InnerMost {
    val: Int;
}

struct ContainsOpt {
    inner: InnerMost?;
}

contract OptStructDefault {
    data: ContainsOpt = ContainsOpt{inner: null};
    
    init() {
        self.data = ContainsOpt{inner: null};
    }
}
