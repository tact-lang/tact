struct SOpt {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract DefaultOpt {
    val: SOpt;
    
    init() {
        self.val = SOpt{
            x: null,
            y: null,
            z: null
        };
    }
}
