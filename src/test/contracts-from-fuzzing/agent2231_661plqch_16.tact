struct OptionalDeep {
    a: Int?;
    b: InnerOpt?;
}

struct InnerOpt {
    x: Int?;
    y: Bool?;
}

contract OptionalDeepContract {
    od: OptionalDeep;

    init() {
        self.od = OptionalDeep{
            a:null,
            b:null
        };
    }
}