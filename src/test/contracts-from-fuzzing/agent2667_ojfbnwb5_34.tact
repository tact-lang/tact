struct MixedOptionalNonOptional {
    x: Int;
    y: Int?;
    z: Bool;
    t: Bool?;
}

contract OptionalMixContract {
    s: MixedOptionalNonOptional;

    init() {
        self.s = MixedOptionalNonOptional{x:1,y:null,z:true,t:null};
    }

    receive() {
        self.s = MixedOptionalNonOptional{x:5,y:10,z:false,t:true};
    }
}