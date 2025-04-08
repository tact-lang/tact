struct InnerS {
    a: Int?;
    b: Bool?;
}

contract OptStructs {
    da: InnerS?;

    init() {
        self.da = InnerS{
            a: null,
            b: true
        };
    }
}