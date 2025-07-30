struct Sflag {
    flag: Bool = true;
}

struct Snum {
    num: Int = 0;
}

contract DefaultStructs {
    sf: Sflag;
    sn: Snum;

    init() {
        self.sf = Sflag{};
        self.sn = Snum{};
    }
}
