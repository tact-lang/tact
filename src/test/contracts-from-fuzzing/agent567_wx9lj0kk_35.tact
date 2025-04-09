// Big nested optional inside persistent variable with mix of primitive fields
struct Little {
    x: Int?;
    y: String?;
}

struct BigOpt {
    lx: Little?;
    b: Bool = true;
    n: Int = 11;
}

contract HasBigOpt {
    val: BigOpt?;
    init() {
        self.val = BigOpt{
            lx: Little{x:null,y:null},
            b:false,
            n:77,
        };
    }
}
