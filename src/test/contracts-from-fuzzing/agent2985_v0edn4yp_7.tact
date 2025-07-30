struct OptInDeep {
    label: String;
    data: Int?;
    flag: Bool?;
}

contract OptionalDeep {
    opt: OptInDeep;

    init() {
        self.opt = OptInDeep{ label: "x", data: null, flag: true };
    }
}
