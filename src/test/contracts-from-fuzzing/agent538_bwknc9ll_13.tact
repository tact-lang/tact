struct DefaultVals {
    a: Int = 10;
    b: Bool = false;
    c: String = "hi";
}

contract DefValContract {
    def: DefaultVals;

    init() {
        self.def = DefaultVals{}; // rely on defaults
    }
}
