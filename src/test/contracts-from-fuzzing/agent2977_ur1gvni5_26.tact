struct OverOpt {
    foo: Int?;
    bar: String?;
    baz: Bool?;
}

contract DefaultsOpt {
    data: OverOpt;

    init() {
        self.data = OverOpt{ foo:null, bar:null, baz:null };
    }
}