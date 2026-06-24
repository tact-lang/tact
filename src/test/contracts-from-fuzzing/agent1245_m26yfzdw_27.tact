struct SimpleNest {
    inn: Int;
    inOpt: Bool?;
}

contract NestAndOpt {
    v1: SimpleNest?;
    v2: Bool;

    init() {
        self.v1 = null;
        self.v2 = true;
    }
}
