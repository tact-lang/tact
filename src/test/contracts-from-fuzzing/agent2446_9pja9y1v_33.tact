struct AB {
    a: Bool;
    b: Int;
}

struct Compound {
    x: AB;
    y: AB;
    z: AB;
}

contract CompoundNested {
    val: Compound;

    init() {
        self.val = Compound{
            x: AB{a:true,b:1},
            y: AB{a:false,b:2},
            z: AB{a:true,b:3}
        };
    }
}