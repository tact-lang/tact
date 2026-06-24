struct Alpha {
    a: Int;
    b: Int?;
}

struct Beta {
    c: Alpha?;
    d: Bool;
}

struct Gamma {
    e: Beta?;
    f: String?;
}

contract MultiNullable {
    data: Gamma;

    init() {
        self.data = Gamma{
            e: null,
            f: null,
        };
    }
}