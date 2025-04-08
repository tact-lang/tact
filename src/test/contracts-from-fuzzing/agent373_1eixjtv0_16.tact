struct SOpt {
    maybe: Int?;
}

contract OptionalInOptional {
    sopt: SOpt?;
    
    init() {
        self.sopt = SOpt{ maybe: null };
    }
}