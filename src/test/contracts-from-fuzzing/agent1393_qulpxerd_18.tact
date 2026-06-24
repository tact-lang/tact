// Large nested optional struct in optional contract field
struct DeepOptional {
    a: Int?;
    b: Bool?;
    s: String?;
    addr: Address?;
}

contract OptFieldTest {
    nestedOpt: DeepOptional?;

    init() {
        self.nestedOpt = DeepOptional{
            a: null,
            b: null,
            s: null,
            addr: null
        };
    }
}
