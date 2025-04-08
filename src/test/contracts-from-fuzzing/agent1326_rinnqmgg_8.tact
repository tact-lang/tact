struct AllOptional {
    a: Int?;
    b: Bool?;
    c: Cell?;
    d: Address?;
    e: String?;
}

contract MassiveNullOpt {
    opt: AllOptional;

    init() {
        self.opt = AllOptional{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null
        };
    }

    receive() {
        let _ = self.opt;
    }
}