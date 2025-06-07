struct DNest {
    f1: Int;
    f2: Bool?;
}

struct MNest {
    p: DNest;
    q: DNest?;
}

contract DeepOptional {
    field: MNest;

    init() {
        self.field = MNest{
            p: DNest{ f1:1, f2:null },
            q: null,
        };
    }

    receive() {
        self.field = MNest{
            p: DNest{ f1:2, f2:true },
            q: DNest{ f1:3, f2:false },
        };
    }
}