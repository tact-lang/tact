struct OptStruct {
    x: Int?;
    y: Bool?;
}

contract OptStructInContract {
    s: OptStruct?;
    init() {
        self.s = null;
    }
}
