struct HasBoolOpt {
    foo: Int;
    bar: Bool?;
}

contract MixedOptBasic {
    f: HasBoolOpt;
    init() {
        self.f = HasBoolOpt{ foo:7, bar:null };
    }
}