struct HasOpt {
    a: Int;
    b: Int?;
}
contract OptOmit {
    v: HasOpt;
    init() {
        self.v = HasOpt{ a: 42 };
    }
}
