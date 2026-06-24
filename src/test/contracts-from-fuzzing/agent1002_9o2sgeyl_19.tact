struct OptBoolInt {
    x: Int?;
    y: Bool?;
}

contract OptionalMix {
    first: OptBoolInt;
    second: OptBoolInt;

    init() {
        self.first = OptBoolInt{ x:null, y:true };
        self.second = OptBoolInt{ x:42, y:null };
    }
}