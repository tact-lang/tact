struct DeepOptional {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract TestContract {
    opt: DeepOptional;

    init() {
        self.opt = DeepOptional{
            a: null,
            b: null,
            c: null,
        };
    }
}
