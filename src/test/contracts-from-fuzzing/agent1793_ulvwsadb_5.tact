struct ParamNest1 {
    a: Int;
    b: Int?;
}

struct ParamNest2 {
    sub: ParamNest1;
    z: Bool;
}

contract Test {
    interm: ParamNest2;

    init() {
        self.interm = ParamNest2{
            sub: ParamNest1{a: 12, b: null}, z: true
        };
    }
}