struct NestedLayerOpt {
    lvl1: OptL1?;
}

struct OptL1 {
    lvl2: OptL2?;
}

struct OptL2 {
    lvl3: OptL3?;
    val: Int?;
}

struct OptL3 {
    flag: Bool?;
    text: String?;
}

contract TestNestedLayerOpt {
    val: NestedLayerOpt = NestedLayerOpt{lvl1:null};

    init() {
        self.val = NestedLayerOpt{
            lvl1: OptL1{
                lvl2: OptL2{
                    lvl3: OptL3{flag:true, text:"hi"},
                    val: 789
                }
            }
        };
    }
}
