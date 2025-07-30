struct Alpha {
    x: Int;
    y: Bool;
}

struct Beta {
    flag: Bool?;
    count: Int;
}

contract MultiStructs {
    a: Alpha;
    b: Beta;

    init() {
        self.a = Alpha{
            x: 7,
            y: true,
        };
        self.b = Beta{
            flag: null,
            count: 42,
        };
    }
}