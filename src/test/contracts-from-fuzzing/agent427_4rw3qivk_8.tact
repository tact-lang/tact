struct ManyOptional {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract ManyOptionalFields {
    opt: ManyOptional;

    init() {
        self.opt = ManyOptional{
            a: null,
            b: null,
            c: null
        };
    }
}