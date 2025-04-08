struct ComboOptional {
    x: Int;
    y: Int?;
    z: String;
    t: Bool?;
}

contract OptionalCombo {
    data: ComboOptional;
    init() {
        self.data = ComboOptional{x:1,y:null,z:"z",t:true};
    }
}