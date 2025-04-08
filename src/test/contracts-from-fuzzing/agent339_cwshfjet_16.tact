struct OptDeep {
    a: Int?;
    b: Int?;
    c: InnerOpt?;
}

struct InnerOpt {
    x: Int?;
    y: Int?;
}

contract DeepOptionalStore {
    data: OptDeep;

    init() {
        self.data = OptDeep{
            a: null,
            b: null,
            c: null
        };
    }
}