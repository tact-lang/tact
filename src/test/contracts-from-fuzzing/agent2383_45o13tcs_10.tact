struct ParamNest1 {
    x: ParamNest2;
}

struct ParamNest2 {
    y: ParamNest3;
}

struct ParamNest3 {
    z: String;
}

contract NestParams {
    info: ParamNest1;
    init() {
        self.info = ParamNest1{ x: ParamNest2{ y: ParamNest3{ z: "deep" } } };
    }
}