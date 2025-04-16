struct ManyLayers {
    l1: Int;
    l2: OptLvl2;
}

struct OptLvl2 {
    l3: DeepOpt?;
}

struct DeepOpt {
    val: Int?;
}

contract CrazyNest {
    many: ManyLayers;

    init() {
        self.many = ManyLayers{
            l1:1,
            l2: OptLvl2{
                l3: null
            }
        };
    }
}
