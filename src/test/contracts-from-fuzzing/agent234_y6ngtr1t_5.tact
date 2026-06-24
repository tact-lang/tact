struct OptionalCrazy {
    x: Int?;
    y: String?;
    z: Bool?;
    addr: Address?;
}

contract OptionalMix {
    data: OptionalCrazy;

    init() {
        self.data = OptionalCrazy{
            x:null,
            y:null,
            z:null,
            addr:null
        };
    }
}