struct SOpt {
    x: Int?;
}

contract OptionalFieldOfStruct {
    s: SOpt;

    init() {
        self.s = SOpt{ x:null };
    }
}