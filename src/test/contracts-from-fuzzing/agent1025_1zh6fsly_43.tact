struct TwoOpt {
    foo: Int?;
    bar: Bool?;
}

contract OptionalBoth {
    f: TwoOpt;

    init() {
        self.f = TwoOpt{ foo:null, bar:null };
    }
}
