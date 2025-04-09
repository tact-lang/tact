struct MixedOptional {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptionalPersists {
    m: MixedOptional;

    init() {
        self.m = MixedOptional{a:null,b:null,c:null};
    }
}