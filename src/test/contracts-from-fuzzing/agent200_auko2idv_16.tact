struct ManyOptionalsDeeper {
    a: InnerOpt?;
    b: InnerOpt?;
}

struct InnerOpt {
    x: Int?;
    y: Bool?;
}

contract ManyDeeperOpt {
    data: ManyOptionalsDeeper;
    init() {
        self.data = ManyOptionalsDeeper{
            a: InnerOpt{x:null, y:true},
            b: null
        };
    }
}