struct ParamSet {
    a: Int = 1;
    b: Bool? = null;
    c: Address;
    d: Int? = null;
}

contract TestContract {
    p: ParamSet;
    init() {
        self.p = ParamSet{
            c: myAddress()
        };
    }
    receive() {}
}