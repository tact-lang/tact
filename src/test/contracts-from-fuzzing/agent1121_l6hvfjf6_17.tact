struct SOpt {
    i: Int?;
    s: String?;
}

contract MixOptionalPrimitives {
    data: SOpt;

    init() {
        self.data = SOpt{i:null, s:null};
    }
}