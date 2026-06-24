struct MixOpt {
    foo: Int?;
    bar: String;
}

contract MixedCont {
    m: MixOpt;

    init() {
        self.m = MixOpt{ foo:null, bar:"abc" };
    }
}
