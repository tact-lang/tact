struct Params {
    s: String;
    b: Bool?;
}

contract OptionalFieldDefault {
    param: Params;

    init() {
        self.param = Params{ s: "x", b: null };
    }
}