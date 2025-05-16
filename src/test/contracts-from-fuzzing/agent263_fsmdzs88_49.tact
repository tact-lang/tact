struct HasAllOptional {
    x: Int?;
    y: Bool?;
    z: String?;
    a: Address?;
}

contract OptionalEverywhere {
    s: HasAllOptional;
    init() {
        self.s = HasAllOptional{x:null,y:null,z:null,a:null};
    }
}