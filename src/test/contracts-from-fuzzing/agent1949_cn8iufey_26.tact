struct Params1 {
    a: Int;
    b: Int;
    c: Int;
}

struct Params2 {
    d: Int;
    e: Params1;
    f: Params1?;
}

contract ContractParamsOpt {
    param1: Params2;

    init() {
        self.param1 = Params2{
            d:1,
            e:Params1{a:2,b:3,c:4},
            f:null
        };
    }
}
