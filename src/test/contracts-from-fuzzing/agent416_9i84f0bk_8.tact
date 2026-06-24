struct C {
    c1: Int;
}

contract ContractOptC {
    oc: C?;

    init() {
        self.oc = null;
    }
}