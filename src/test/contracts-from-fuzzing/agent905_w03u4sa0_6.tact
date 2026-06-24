struct DeepOptional {
    layer: Int?;
    flag: Bool?;
}

contract OptionalFields {
    opt: DeepOptional;
    init() {
        self.opt = DeepOptional{
            layer: null,
            flag: true
        };
    }
}
