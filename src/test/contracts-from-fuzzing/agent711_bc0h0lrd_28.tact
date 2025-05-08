struct OptionalsAndDefaults {
    x: Int?;
    y: Bool?;
    z: String = "zzz";
}

contract DefaultAndOptionalMix {
    field: OptionalsAndDefaults;

    init(){
        self.field = OptionalsAndDefaults{
            x:null,
            y:null
        };
    }
}
