struct WithAs {
    a: Int? as uint32;
}

contract TestContract {
    wa: WithAs;

    init() {
        self.wa = WithAs {};  
    }
}