struct Alpha {
    a: Int;
    b: Bool?;
}

struct Beta {
    c: Alpha;
    d: String;
}

contract NestMany {
    beta: Beta;

    init() {
        self.beta = Beta{
            c: Alpha{a:123, b:true},
            d: "str"
        };
    }
}