struct OptionalPrimMix {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract OptPrimFields {
    slot: OptionalPrimMix;
    init() {
        self.slot = OptionalPrimMix{
            x:null,y:true,z:null
        };
    }
}