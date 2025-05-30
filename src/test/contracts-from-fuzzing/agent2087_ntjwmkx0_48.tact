struct OptBoolInt {
    b: Bool?;
    i: Int?;
}

contract OptionalInterior {
    s: OptBoolInt;

    init() {
        self.s = OptBoolInt{b:null,i:null};
    }
}