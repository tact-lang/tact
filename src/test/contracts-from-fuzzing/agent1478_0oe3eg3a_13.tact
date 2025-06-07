struct OptBoolAndInt {
    optB: Bool?;
    optI: Int?;
    val: Int;
}

contract OptBoolInt {
    d: OptBoolAndInt;
    init() {
        self.d = OptBoolAndInt{ optB:null, optI:null, val:5 };
    }
}
