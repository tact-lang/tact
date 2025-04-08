struct Sopt {
    oi: Int?;
    ob: Bool?;
    os: String?;
}

contract StructOpt {
    s: Sopt;

    init() {
        self.s = Sopt{ oi: null, ob: null, os: null };
    }
}