struct LargeOptionalNest {
    a: Int?;
    b: InnerOpt?;
}

struct InnerOpt {
    x: Int?;
    y: String?;
    z: Bool?;
}

contract TestContract {
    data: LargeOptionalNest;

    init() {
        self.data = LargeOptionalNest{
            a: null,
            b: InnerOpt{
                x:null,
                y:null,
                z:true
            }
        };
    }
}