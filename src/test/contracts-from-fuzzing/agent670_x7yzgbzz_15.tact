struct FlatOptional {
    p: Int?;
    q: Bool?;
}

contract TopLevelOptionals {
    f: FlatOptional;

    init() {
        self.f = FlatOptional{
            p: null,
            q: null,
        };
    }
}