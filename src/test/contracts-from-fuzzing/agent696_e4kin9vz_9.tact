struct MixedOptionals {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract VariousOptionals {
    val: MixedOptionals;

    init() {
        self.val = MixedOptionals{x:null,y:null,z:null};
    }
}
