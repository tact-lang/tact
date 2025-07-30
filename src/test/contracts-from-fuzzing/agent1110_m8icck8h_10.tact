struct Alpha {
    id: Int?;
    flag: Bool;
}

struct Beta {
    desc: String?;
    active: Bool?;
}

contract TestContract {
    a: Alpha;
    b: Beta;

    init() {
        self.a = Alpha{
            id: null,
            flag: true,
        };
        self.b = Beta{
            desc: null,
            active: null,
        };
    }
}