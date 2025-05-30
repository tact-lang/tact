struct Nesty { sub: SubS?; }
struct SubS { val: Int?; }

contract OptNest {
    f: Nesty = Nesty{sub:null};

    init() {
        self.f = Nesty{sub:null};
    }
}