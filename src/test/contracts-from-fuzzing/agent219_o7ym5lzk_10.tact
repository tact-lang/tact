struct SubOption {
    a: Int?;
    b: Bool?;
    s: String?;
}

contract PurelyOptionalStruct {
    sub: SubOption;

    init() {
        self.sub = SubOption{
            a: null,
            b: null,
            s: null
        };
    }
}