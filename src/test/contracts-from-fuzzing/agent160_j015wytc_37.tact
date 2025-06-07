struct OptionDefaultMix {
    x: Int?;
    y: Int = 1;
    z: String?;
}

contract OptionDef {
    f: OptionDefaultMix;
    init() {
        self.f = OptionDefaultMix{
            x:null,
            z:null
        };
    }
}