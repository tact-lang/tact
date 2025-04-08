struct BoolVariants {
    a: Bool;
    b: Bool?;
    c: Bool;
    d: Bool?;
}

contract BoolMixOpt {
    bvar: BoolVariants;

    init() {
        self.bvar = BoolVariants{
            a:true, b:null, c:false, d:true
        };
    }
}