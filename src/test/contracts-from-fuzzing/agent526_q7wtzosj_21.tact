struct SOptional {
    a: Int?;
    b: String?;
}

contract OptionalDefaultsInit {
    s: SOptional = SOptional{a:null,b:null};

    init() {
        self.s = SOptional{
            a: null,
            b: null,
        };
    }
}
