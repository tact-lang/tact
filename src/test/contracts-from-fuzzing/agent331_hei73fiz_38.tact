struct NestBoolOpt {
    a: Bool?;
    b: Bool;
}

contract TwoLayerBooleans {
    data: NestBoolOpt;

    init() {
        self.data = NestBoolOpt{
            a:null,
            b:true
        };
    }
}