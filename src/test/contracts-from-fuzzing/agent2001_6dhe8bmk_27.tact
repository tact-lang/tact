struct OnlyOptional {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OnlyOptionalContract {
    s: OnlyOptional;

    init() {
        self.s = OnlyOptional{
            a:null,
            b:null,
            c:null,
        };
    }
}