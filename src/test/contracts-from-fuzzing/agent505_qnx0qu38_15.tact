struct InnerOpt {
    s: String?;
    b: Bool?;
}

struct OuterOpt {
    num: Int?;
    inner: InnerOpt;
}

contract OptionDeep {
    data: OuterOpt = OuterOpt{ num: null, inner: InnerOpt {s:null, b:null} };

    init() {
        self.data = OuterOpt{ num: 5, inner: InnerOpt{ s:"str", b:true} };
    }

    receive() {
        self.data = self.data;
    }
}